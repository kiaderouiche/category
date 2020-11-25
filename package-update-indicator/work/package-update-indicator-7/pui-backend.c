/*
 * Copyright (C) 2018 Guido Berhoerster <guido+pui@berhoerster.name>
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <errno.h>
#include <fcntl.h>
#include <packagekit-glib2/packagekit.h>
#include <polkit/polkit.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <upower.h>
#include <utime.h>

#include "pui-common.h"
#include "pui-backend.h"
#include "pui-get-updates.h"
#include "pui-types.h"

#define	LOW_BATTERY_THRESHOLD		10.0	/* % */
#define	UPDATES_CHANGED_UNBLOCK_DELAY	4	/* s */

struct _PuiBackend {
	GObject		parent_instance;
	PkControl	*pk_control;
	GCancellable	*cancellable;
	PkClient	*pk_client;
	PkTransactionList *transaction_list;
	UpClient	*up_client;
	UpDevice	*up_device;
	gchar		*proxy_http;
	gchar		*proxy_https;
	gchar		*proxy_ftp;
	gchar		*proxy_socks;
	gchar		*no_proxy;
	gchar		*pac;
	gint64		last_check;
	PkNetworkEnum	network_state;
	gboolean	inhibited;
	gboolean	is_battery_low;
	guint		check_id;
	guint		unblock_updates_changed_id;
	guint		refresh_interval;
	gboolean	use_mobile_connection;
	guint		important_updates;
	guint		normal_updates;
	PuiRestart	restart_type;
};

static void	pui_backend_async_initable_iface_init(gpointer, gpointer);

G_DEFINE_TYPE_WITH_CODE(PuiBackend, pui_backend, G_TYPE_OBJECT,
    G_IMPLEMENT_INTERFACE(G_TYPE_ASYNC_INITABLE,
    pui_backend_async_initable_iface_init))

enum {
    STATE_CHANGED,
    RESTART_REQUIRED,
    SIGNAL_LAST
};

enum {
    PROP_0,
    PROP_IMPORTANT_UPDATES,
    PROP_NORMAL_UPDATES,
    PROP_RESTART_TYPE,
    PROP_REFRESH_INTERVAL,
    PROP_USE_MOBILE_CONNECTION,
    PROP_LAST
};

static guint	signals[SIGNAL_LAST] = { 0 };
static GParamSpec *properties[PROP_LAST] = { NULL };

static gboolean	periodic_check(gpointer);
static void	on_updates_changed(PkControl *, gpointer);

GQuark
pui_backend_error_quark(void)
{
	return (g_quark_from_static_string("pui-backend-error-quark"));
}

static void
process_pk_package(gpointer data, gpointer user_data)
{
	PkPackage	*package = data;
	PuiBackend	*self = user_data;
	PkInfoEnum	type_info = pk_package_get_info(package);

	switch (type_info) {
	case PK_INFO_ENUM_LOW:		/* FALLTHROUGH */
	case PK_INFO_ENUM_ENHANCEMENT:	/* FALLTHROUGH */
	case PK_INFO_ENUM_NORMAL:
		self->normal_updates++;
		break;
	case PK_INFO_ENUM_BUGFIX:	/* FALLTHROUGH */
	case PK_INFO_ENUM_IMPORTANT:	/* FALLTHROUGH */
	case PK_INFO_ENUM_SECURITY:
		self->important_updates++;
		break;
	default:
		break;
	}
}

static gboolean
unblock_updates_changed(gpointer user_data)
{
	PuiBackend	*self = user_data;

	g_signal_handlers_unblock_by_func(self->pk_control, on_updates_changed,
	    self);
	self->unblock_updates_changed_id = 0;

	return (G_SOURCE_REMOVE);
}

static void
on_get_updates_finished(GObject *source_object, GAsyncResult *async_result,
    gpointer user_data)
{
	PuiBackend	*self = user_data;
	GPtrArray	*package_list = NULL;
	GError		*error = NULL;
	guint		prev_normal_updates = self->normal_updates;
	guint		prev_important_updates = self->important_updates;

	package_list = pui_get_updates_finish(async_result, &error);
	if (package_list == NULL) {
		if (g_error_matches(error, G_IO_ERROR, G_IO_ERROR_CANCELLED) ||
		    g_error_matches(error, PUI_GET_UPDATES_ERROR,
		    PUI_GET_UPDATES_ERROR_CANCELLED)) {
			/* cancelled */
			g_debug("cancelled checking for updates");
		} else {
			g_warning("failed to check for updates: %s",
			    error->message);
		}
		g_error_free(error);
		goto out;
	}

	self->normal_updates = 0;
	self->important_updates = 0;
	g_ptr_array_foreach(package_list, process_pk_package, self);
	g_debug("normal updates: %u, important updates: %u",
	    self->normal_updates, self->important_updates);
	if (self->normal_updates != prev_normal_updates) {
		g_object_notify_by_pspec(G_OBJECT(self),
		    properties[PROP_NORMAL_UPDATES]);
	}
	if (self->important_updates != prev_important_updates) {
		g_object_notify_by_pspec(G_OBJECT(self),
		    properties[PROP_IMPORTANT_UPDATES]);
	}
	if ((self->normal_updates != prev_normal_updates) ||
	    (self->important_updates != prev_important_updates)) {
		g_debug("emitting signal state-changed");
		g_signal_emit(self, signals[STATE_CHANGED], 0);
	}

	/* last successful check */
	self->last_check = g_get_monotonic_time();

out:
	g_clear_object(&self->cancellable);

	/* reschedule periodic check */
	if (!self->inhibited) {
		self->check_id =
		    g_timeout_add_seconds(PUI_CHECK_UPDATES_INTERVAL,
		    periodic_check, self);
	}

	/* handle get-updates signals again after a short delay */
	self->unblock_updates_changed_id =
	    g_timeout_add_seconds(UPDATES_CHANGED_UNBLOCK_DELAY,
	    unblock_updates_changed, self);

	if (package_list != NULL) {
		g_ptr_array_unref(package_list);
	}
}

static void
run_check(PuiBackend *self, gboolean refresh_cache)
{
	/* block any get-updates signals emitted when refreshing the cache */
	if (self->unblock_updates_changed_id != 0) {
		/* still blocked */
		g_source_remove(self->unblock_updates_changed_id);
		self->unblock_updates_changed_id = 0;
	} else {
		g_signal_handlers_block_by_func(self->pk_control,
		    G_CALLBACK(on_updates_changed), self);
	}

	self->cancellable = g_cancellable_new();
	pui_get_updates_async(self->pk_control,
	    refresh_cache ? self->refresh_interval : G_MAXUINT,
	    self->cancellable, on_get_updates_finished, self);

	/* next periodic check will be scheduled after completion */
	self->check_id = 0;
}

static gboolean
irregular_check(gpointer user_data)
{
	PuiBackend	*self = user_data;

	g_debug("running check");

	run_check(self, FALSE);

	return (G_SOURCE_REMOVE);
}

static gboolean
periodic_check(gpointer user_data)
{
	PuiBackend	*self = user_data;

	g_debug("running periodic check");

	run_check(self, TRUE);

	return (G_SOURCE_REMOVE);
}

static void
check_inhibit(PuiBackend *self)
{
	gboolean	is_offline;
	gboolean	is_disallowed_mobile;
	gboolean	inhibited;
	guint		elapsed_time;
	guint		remaining_time;

	is_offline = self->network_state == PK_NETWORK_ENUM_OFFLINE;
	is_disallowed_mobile = !self->use_mobile_connection &&
	    (self->network_state == PK_NETWORK_ENUM_MOBILE);
	inhibited = is_offline || is_disallowed_mobile || self->is_battery_low;
	if (self->inhibited == inhibited) {
		return;
	}

	self->inhibited = inhibited;
	if (inhibited) {
		/* cancel periodic checks */
		if (self->check_id != 0) {
			g_source_remove(self->check_id);
		}

		/* cancel running operation */
		if ((self->cancellable != NULL) &&
		    !g_cancellable_is_cancelled(self->cancellable)) {
			g_cancellable_cancel(self->cancellable);
			g_clear_object(&self->cancellable);
		}

		if (is_offline) {
			g_debug("perioidic checks inhibited: network offline");
		}
		if (is_disallowed_mobile) {
			g_debug("perioidic checks inhibited: use of mobile "
			    "connection not allowed");
		}
		if (self->is_battery_low) {
			g_debug("perioidic checks inhibited: low battery");
		}
	} else {
		if (self->last_check == 0) {
			/* first check after startup */
			remaining_time = PUI_STARTUP_DELAY;

			g_debug("scheduled first check in: %ds",
			    remaining_time);
		} else {
			/* schedule periodic checks when no longer inhibited */
			elapsed_time =
			    (g_get_monotonic_time() - self->last_check) /
			    G_USEC_PER_SEC;
			/*
			 * if more time than the check interval has passed
			 * since the last check, schedule a check after a short
			 * delay, otherwise wait until the interval has passed
			 */
			remaining_time =
			    (elapsed_time < PUI_CHECK_UPDATES_INTERVAL) ?
			    PUI_CHECK_UPDATES_INTERVAL - elapsed_time :
			    PUI_STARTUP_DELAY;

			g_debug("perioidic checks no longer inhibited, "
			    "time since last check: %ds, next check in: %ds",
			    elapsed_time, remaining_time);
		}
		self->check_id = g_timeout_add_seconds(remaining_time,
		    periodic_check, self);
	}
}

static void
pui_backend_set_property(GObject *object, guint property_id,
    const GValue *value, GParamSpec *pspec)
{
	PuiBackend	*self = PUI_BACKEND(object);

	switch (property_id) {
	case PROP_REFRESH_INTERVAL:
		self->refresh_interval = g_value_get_uint(value);
		g_debug("property \"refresh-interval\" set to %u",
		    self->refresh_interval);
		break;
	case PROP_USE_MOBILE_CONNECTION:
		self->use_mobile_connection = g_value_get_boolean(value);
		g_debug("property \"use-mobile-connection\" set to %s",
		    self->use_mobile_connection ? "true" : "false");
		check_inhibit(self);
		break;
	default:
		G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property_id, pspec);
		break;
	}
}

static void
pui_backend_get_property(GObject *object, guint property_id, GValue *value,
    GParamSpec *pspec)
{
	PuiBackend	*self = PUI_BACKEND(object);

	switch (property_id) {
	case PROP_IMPORTANT_UPDATES:
		g_value_set_uint(value, self->important_updates);
		break;
	case PROP_NORMAL_UPDATES:
		g_value_set_uint(value, self->normal_updates);
		break;
	case PROP_RESTART_TYPE:
		g_value_set_enum(value, self->restart_type);
		break;
	case PROP_REFRESH_INTERVAL:
		g_value_set_uint(value, self->refresh_interval);
		break;
	case PROP_USE_MOBILE_CONNECTION:
		g_value_set_boolean(value, self->use_mobile_connection);
		break;
	default:
		G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property_id, pspec);
		break;
	}
}

static void
pui_backend_dispose(GObject *object)
{
	PuiBackend	*self = PUI_BACKEND(object);

	if (self->check_id != 0) {
		g_source_remove(self->check_id);
		self->check_id = 0;
	}

	if (self->unblock_updates_changed_id != 0) {
		g_source_remove(self->unblock_updates_changed_id);
		self->unblock_updates_changed_id = 0;
	}

	if (self->transaction_list != NULL) {
		g_clear_object(&self->transaction_list);
	}

	if (self->pk_client != NULL) {
		g_clear_object(&self->pk_client);
	}

	if (self->cancellable != NULL) {
		g_cancellable_cancel(self->cancellable);
		g_clear_object(&self->cancellable);
	}

	if (self->pk_control != NULL) {
		g_clear_object(&self->pk_control);
	}

	if (self->up_device != NULL) {
		g_clear_object(&self->up_device);
	}

	if (self->up_client != NULL) {
		g_clear_object(&self->up_client);
	}

	G_OBJECT_CLASS(pui_backend_parent_class)->dispose(object);
}

static void
pui_backend_finalize(GObject *object)
{
	PuiBackend	*self = PUI_BACKEND(object);

	g_free(self->proxy_http);
	g_free(self->proxy_https);
	g_free(self->proxy_ftp);
	g_free(self->proxy_socks);
	g_free(self->no_proxy);
	g_free(self->pac);

	G_OBJECT_CLASS(pui_backend_parent_class)->finalize(object);
}

static void
pui_backend_class_init(PuiBackendClass *klass)
{
	GObjectClass	*object_class = G_OBJECT_CLASS(klass);

	object_class->set_property = pui_backend_set_property;
	object_class->get_property = pui_backend_get_property;
	object_class->dispose = pui_backend_dispose;
	object_class->finalize = pui_backend_finalize;

	properties[PROP_IMPORTANT_UPDATES] =
	    g_param_spec_uint("important-updates", "Important updates",
	    "Number of available important updates", 0, G_MAXUINT, 0,
	    G_PARAM_READABLE);

	properties[PROP_NORMAL_UPDATES] =
	    g_param_spec_uint("normal-updates", "Normal updates",
	    "Number of available normal updates", 0, G_MAXUINT, 0,
	    G_PARAM_READABLE);

	properties[PROP_RESTART_TYPE] =
	    g_param_spec_enum("restart-type", "Type of restart required",
	    "The Type of restart required", PUI_TYPE_RESTART, PUI_RESTART_NONE,
	    G_PARAM_READABLE);

	properties[PROP_REFRESH_INTERVAL] =
	    g_param_spec_uint("refresh-interval", "Refresh interval",
	    "Interval in seconds for refreshing the package cache", 0,
	    G_MAXUINT, PUI_DEFAULT_REFRESH_INTERVAL, G_PARAM_READWRITE);

	properties[PROP_USE_MOBILE_CONNECTION] =
	    g_param_spec_boolean("use-mobile-connection",
	    "Whether to use a mobile connection", "Whether to use a mobile "
	    "connection for refreshing the package cache", FALSE,
	    G_PARAM_READWRITE);

	g_object_class_install_properties(object_class, PROP_LAST, properties);

	signals[STATE_CHANGED] = g_signal_new("state-changed",
	    G_TYPE_FROM_CLASS(object_class),
	    G_SIGNAL_RUN_LAST | G_SIGNAL_NO_RECURSE | G_SIGNAL_NO_HOOKS, 0,
	    NULL, NULL, NULL, G_TYPE_NONE, 0);

	signals[RESTART_REQUIRED] = g_signal_new("restart-required",
	    G_TYPE_FROM_CLASS(object_class),
	    G_SIGNAL_RUN_LAST | G_SIGNAL_NO_RECURSE | G_SIGNAL_NO_HOOKS, 0,
	    NULL, NULL, NULL, G_TYPE_NONE, 0);
}

static void
pui_backend_init(PuiBackend *self)
{
	self->pk_control = pk_control_new();

	self->pk_client = pk_client_new();

	self->inhibited = TRUE;

	self->up_client = up_client_new();
	if (self->up_client) {
		self->up_device = up_client_get_display_device(self->up_client);
	}
}

static void
on_get_properties_finished(GObject *object, GAsyncResult *result,
    gpointer user_data)
{
	PkControl	*control = PK_CONTROL(object);
	PuiBackend	*self;
	GTask		*task = user_data;
	GError		*error = NULL;
	gchar		*backend_name = NULL;
	PkBitfield	roles = 0;
	gchar		*roles_str = NULL;

	self = g_task_get_task_data(task);

	if (!pk_control_get_properties_finish(control, result, &error)) {
		g_task_return_error(task, error);
		goto out;
	}

	/* check whether the backend supports GetUpdates */
	g_object_get(control, "backend-name", &backend_name, "roles", &roles,
	    "network-state", &self->network_state, NULL);
	g_debug("backend: %s", backend_name);
	roles_str = pk_role_bitfield_to_string(roles);
	g_debug("roles: %s", roles_str);
	g_debug("network-state: %s",
	    pk_network_enum_to_string(self->network_state));
	if (!pk_bitfield_contain(roles, PK_ROLE_ENUM_GET_UPDATES)) {
		error = g_error_new(PUI_BACKEND_ERROR,
		    PUI_BACKEND_ERROR_GET_UPDATES_NOT_IMPLEMENTED,
		    "Getting updates is not implemented in the %s PackageKit "
		    "backend", backend_name);
		g_task_return_error(task, error);
		goto out;
	}

	g_task_return_boolean(task, TRUE);
out:
	g_free(roles_str);
	g_free(backend_name);
	g_object_unref(task);
}

static void
on_notify_device_charge_percentage(UpDevice *device, GParamSpec *pspec,
    gpointer user_data)
{
	PuiBackend	*self = user_data;
	UpDeviceKind	kind;
	gdouble		percentage;

	g_object_get(device, "kind", &kind, "percentage", &percentage, NULL);
	if ((kind != UP_DEVICE_KIND_BATTERY) && (kind != UP_DEVICE_KIND_UPS)) {
		return;
	}
	g_debug("charge percentage changed: %.0f%%\n", percentage);
	if ((self->is_battery_low && (percentage > LOW_BATTERY_THRESHOLD)) ||
	    (!self->is_battery_low && (percentage < LOW_BATTERY_THRESHOLD))) {
		self->is_battery_low = !self->is_battery_low;
		check_inhibit(self);
	}
}

static void
on_notify_network_state(PkControl *pk_control, GParamSpec *pspec,
    gpointer user_data)
{
	PuiBackend	*self = user_data;

	g_object_get(pk_control, "network-state", &self->network_state, NULL);
	g_debug("network state changed: %s",
	    pk_network_enum_to_string(self->network_state));
	check_inhibit(self);
}

static void
on_updates_changed(PkControl *control, gpointer user_data)
{
	PuiBackend	*self = user_data;

	g_debug("package metatdata cache invalidated");

	/*
	 * schedule a check after a short delay so that a rapid succession of
	 * signals is coalesced
	 */
	if (!self->inhibited) {
		if (self->check_id != 0) {
			g_source_remove(self->check_id);
		}
		self->check_id =
		    g_timeout_add_seconds(PUI_UPDATES_CHANGED_DELAY,
		    irregular_check, self);
	}
}

static void
on_restart_schedule(PkControl *control, gpointer user_data)
{
	PuiBackend	*self = user_data;

	/*
	 * do not restart package-update-indicator if a session or system
	 * restart is required since that iformation would be lost across the
	 * restart, rather keep running and risk errors when interacting with
	 * a newer version of the PackageKit daemon
	 */
	if (self->restart_type > PUI_RESTART_NONE) {
		return;
	}

	g_debug("emitting signal restart-required");
	g_signal_emit(self, signals[RESTART_REQUIRED], 0);
}

static void
on_transaction_adopt_finish(GObject *source_object, GAsyncResult *result,
    gpointer user_data)
{
	PuiBackend	*self = user_data;
	PkClient	*pk_client = PK_CLIENT(source_object);
	PkResults	*results;
	GError		*error = NULL;
	PkRestartEnum	restart;

	results = pk_client_generic_finish(pk_client, result, &error);
	if (results == NULL) {
		g_warning("failed to get transaction results: %s",
		    error->message);
		g_error_free(error);
		goto out;
	}

	/* check if transaction requires a restart */
	restart = pk_results_get_require_restart_worst(results);
	switch (restart) {
	case PK_RESTART_ENUM_SESSION:		/* FALLTHROUGH */
	case PK_RESTART_ENUM_SECURITY_SESSION:
		if (self->restart_type < PUI_RESTART_SESSION) {
			self->restart_type = PUI_RESTART_SESSION;
			g_object_notify_by_pspec(G_OBJECT(self),
			    properties[PROP_RESTART_TYPE]);
			g_signal_emit(self, signals[STATE_CHANGED], 0);
		}
		break;
	case PK_RESTART_ENUM_SYSTEM:		/* FALLTHROUGH */
	case PK_RESTART_ENUM_SECURITY_SYSTEM:
		if (self->restart_type < PUI_RESTART_SYSTEM) {
			self->restart_type = PUI_RESTART_SYSTEM;
			g_object_notify_by_pspec(G_OBJECT(self),
			    properties[PROP_RESTART_TYPE]);
			g_signal_emit(self, signals[STATE_CHANGED], 0);
		}
		break;
	default:
		/* do nothing */
		break;
	}

	g_debug("transaction finished, required restart: %s",
	    pk_restart_enum_to_string(restart));

out:
	if (results != NULL) {
		g_object_unref(results);
	}
}

static void
on_transaction_list_added(PkTransactionList *transaction_list,
    const gchar *transaction_id, gpointer user_data)
{
	PuiBackend	*self = user_data;

	/* adopt transaction in order to monitor it for restart requirements */
	pk_client_adopt_async(self->pk_client, transaction_id, NULL, NULL,
	    NULL, on_transaction_adopt_finish, user_data);
}

static void
pui_backend_init_async(GAsyncInitable *initable, int io_priority,
    GCancellable *cancellable, GAsyncReadyCallback callback, gpointer user_data)
{
	PuiBackend	*self = PUI_BACKEND(initable);
	GTask		*task;

	task = g_task_new(G_OBJECT(initable), cancellable, callback, user_data);
	g_task_set_priority(task, io_priority);
	g_task_set_task_data(task, g_object_ref(self),
	    (GDestroyNotify)g_object_unref);

	pk_control_get_properties_async(self->pk_control, cancellable,
	    on_get_properties_finished, task);
}

static gboolean
pui_backend_init_finish(GAsyncInitable *initable, GAsyncResult *result,
    GError **errorp)
{
	PuiBackend	*self = PUI_BACKEND(initable);
	GTask		*task = G_TASK(result);
	UpDeviceKind	kind;
	gdouble		percentage;

	if (!g_task_propagate_boolean(task, errorp)) {
		return (FALSE);
	}

	if (self->up_device != NULL) {
		/* get the kind of device and charge percentage */
		g_object_get(self->up_device, "kind", &kind, "percentage",
		    &percentage, NULL);
		if ((kind == UP_DEVICE_KIND_BATTERY) ||
		    (kind == UP_DEVICE_KIND_UPS)) {
			self->is_battery_low =
			    (percentage < LOW_BATTERY_THRESHOLD);
		}

		/* get notification if the charge percentage changes */
		g_signal_connect(self->up_device, "notify::percentage",
		    G_CALLBACK(on_notify_device_charge_percentage), self);
	}

	/* get notification when the network state changes */
	g_signal_connect(self->pk_control, "notify::network-state",
	    G_CALLBACK(on_notify_network_state), self);
	/* get notifications when the package metatdata cache is invalidated */
	g_signal_connect(self->pk_control, "updates-changed",
	    G_CALLBACK(on_updates_changed), self);
	/* get notifications when an application restart is required */
	g_signal_connect(self->pk_control, "restart-schedule",
	    G_CALLBACK(on_restart_schedule), self);
	/* get notifications when a transactions are added */
	self->transaction_list = pk_transaction_list_new();
	g_signal_connect(self->transaction_list, "added",
	    G_CALLBACK(on_transaction_list_added), self);

	check_inhibit(self);

	return (TRUE);
}

static void
pui_backend_async_initable_iface_init(gpointer g_iface, gpointer iface_data)
{
	GAsyncInitableIface	*iface = g_iface;

	iface->init_async = pui_backend_init_async;
	iface->init_finish = pui_backend_init_finish;
}

void
pui_backend_new_async(GCancellable *cancellable, GAsyncReadyCallback callback,
    gpointer user_data)
{
	g_async_initable_new_async(PUI_TYPE_BACKEND, G_PRIORITY_DEFAULT,
	    cancellable, callback, user_data, NULL);
}

PuiBackend *
pui_backend_new_finish(GAsyncResult *result, GError **errorp)
{
	GObject	*object;
	GObject	*source_object;

	source_object = g_async_result_get_source_object(result);
	object = g_async_initable_new_finish(G_ASYNC_INITABLE(source_object),
	    result, errorp);
	g_object_unref(source_object);

	return ((object != NULL) ? PUI_BACKEND(object) : NULL);
}

static void
on_set_proxy_finished(GObject *source_object, GAsyncResult *result,
    gpointer user_data)
{
	PuiBackend	*self = user_data;
	GError		*error = NULL;

	if (!pk_control_set_proxy_finish(self->pk_control, result, &error)) {
		g_warning("failed to set proxies: %s", error->message);
		g_error_free(error);
	}
}

static void
on_polkit_permission_finished(GObject *source_object, GAsyncResult *result,
    gpointer user_data)
{
	PuiBackend	*self = user_data;
	GPermission	*permission;
	GError		*error = NULL;

	permission = polkit_permission_new_finish(result, &error);
	if (permission == NULL) {
		g_warning("failed to create PolKit permission for setting the "
		    "network proxies: %s", error->message);
		g_error_free(error);
		return;
	}

	if (!g_permission_get_allowed(permission)) {
		/* setting the proxy requires authentication or is disallowed */
		g_debug("setting the network proxy is not allowed");
		return;
	}

	g_debug("setting HTTP proxy to \"%s\"", (self->proxy_http != NULL) ?
	    self->proxy_http : "(null)");
	g_debug("setting HTTPS proxy to \"%s\"", (self->proxy_https != NULL) ?
	    self->proxy_https : "(null)");
	g_debug("setting FTP proxy to \"%s\"", (self->proxy_ftp != NULL) ?
	    self->proxy_ftp : "(null)");
	g_debug("setting SOCKS proxy to \"%s\"", (self->proxy_socks != NULL) ?
	    self->proxy_socks : "(null)");
	g_debug("setting the list of download IPs which should not go through "
	    "a proxy to \"%s\"", (self->no_proxy != NULL) ? self->no_proxy :
	    "(null)");
	g_debug("setting the PAC string to \"%s\"", (self->pac != NULL) ?
	    self->pac : "(null)");
	pk_control_set_proxy2_async(self->pk_control, self->proxy_http,
	    self->proxy_https, self->proxy_ftp, self->proxy_socks,
	    self->no_proxy, self->pac, NULL, on_set_proxy_finished, self);
}

void
pui_backend_set_proxy(PuiBackend *self, const gchar *proxy_http,
    const gchar *proxy_https, const gchar *proxy_ftp, const gchar *proxy_socks,
    const gchar *no_proxy, const gchar *pac)
{
	g_free(self->proxy_http);
	self->proxy_http = (proxy_http != NULL) ? g_strdup(proxy_http) : NULL;
	g_free(self->proxy_https);
	self->proxy_https = (proxy_https != NULL) ? g_strdup(proxy_https) :
	    NULL;
	g_free(self->proxy_ftp);
	self->proxy_ftp = (proxy_ftp != NULL) ? g_strdup(proxy_ftp) : NULL;
	g_free(self->proxy_socks);
	self->proxy_socks = (proxy_socks != NULL) ? g_strdup(proxy_socks) :
	    NULL;
	g_free(self->no_proxy);
	self->no_proxy = (no_proxy != NULL) ? g_strdup(no_proxy) : NULL;
	g_free(self->pac);
	self->pac = (pac != NULL) ? g_strdup(pac) : NULL;

	polkit_permission_new("org.freedesktop.packagekit."
	    "system-network-proxy-configure", NULL, NULL,
	    on_polkit_permission_finished, self);
}
