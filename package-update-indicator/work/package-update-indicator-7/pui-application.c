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

#include <gio/gdesktopappinfo.h>
#include <glib/gi18n.h>
#ifndef	HAVE_AYATANA_APPINDICATOR
#include <libappindicator/app-indicator.h>
#else /* !HAVE_AYATANA_APPINDICATOR */
#include <libayatana-appindicator/app-indicator.h>
#endif /* !HAVE_AYATANA_APPINDICATOR */
#include <stdlib.h>
#include <string.h>

#include "pui-application.h"
#include "pui-backend.h"
#include "pui-common.h"
#include "pui-settings.h"
#include "pui-types.h"

struct _PuiApplication {
	GApplication	parent_instance;
	GSettings	*settings;
	GCancellable	*cancellable;
	PuiBackend	*backend;
	AppIndicator	*indicator;
	GtkWidget	*about_dialog;
	GIcon		*icons[PUI_STATE_LAST];
	PuiState	state;
	gchar		*update_command;
	gchar		*error_message;
};

G_DEFINE_TYPE(PuiApplication, pui_application, G_TYPE_APPLICATION)

enum {
    PROP_0,
    PROP_UPDATE_COMMAND,
    PROP_LAST
};

extern gboolean	restart;

static GParamSpec *properties[PROP_LAST] = { NULL };

static const gchar *icon_names[PUI_STATE_LAST] = {
    [PUI_STATE_INITIAL] = "system-software-update",
    [PUI_STATE_UP_TO_DATE] = "system-software-update",
    [PUI_STATE_NORMAL_UPDATES_AVAILABLE] = "software-update-available",
    [PUI_STATE_IMPORTANT_UPDATES_AVAILABLE] = "software-update-urgent",
    [PUI_STATE_SESSION_RESTART_REQUIRED] = "system-log-out",
    [PUI_STATE_SYSTEM_RESTART_REQUIRED] = "system-reboot",
    [PUI_STATE_ERROR] = "dialog-warning"
};

static const GOptionEntry cmd_options[] = {
    { "debug", '\0', G_OPTION_FLAG_NONE, G_OPTION_ARG_NONE, NULL,
    N_("Enable debugging messages"), NULL },
    { "quit", 'q', G_OPTION_FLAG_NONE, G_OPTION_ARG_NONE, NULL,
    N_("Quit running instance of Package Update Indicator"), NULL },
    { "version", 'V', G_OPTION_FLAG_NONE, G_OPTION_ARG_NONE, NULL,
    N_("Print the version number and quit"), NULL },
    { G_OPTION_REMAINING, 0, 0, G_OPTION_ARG_FILENAME_ARRAY, NULL, NULL, NULL },
    { NULL }
};

static void	pui_application_show_about_dialog(GSimpleAction *, GVariant *,
    gpointer);
static void	pui_application_open_preferences(GSimpleAction *, GVariant *,
    gpointer);
static void	pui_application_quit(GSimpleAction *, GVariant *, gpointer);
static void	pui_application_install_updates(GSimpleAction *, GVariant *,
    gpointer);

static const GActionEntry pui_application_actions[] = {
    { "about", pui_application_show_about_dialog },
    { "preferences", pui_application_open_preferences },
    { "quit", pui_application_quit },
    { "install-updates", pui_application_install_updates }
};

static gboolean
program_exists(const gchar *command_line)
{
	gboolean	is_program_in_path;
	gchar		**argv = NULL;
	gchar		*program_path;

	if (!g_shell_parse_argv(command_line, NULL, &argv, NULL)) {
		return (FALSE);
	}
	program_path = g_find_program_in_path(argv[0]);
	is_program_in_path = (program_path != NULL) ? TRUE : FALSE;
	g_free(program_path);
	g_strfreev(argv);

	return (is_program_in_path);
}

static void
pui_application_show_about_dialog(GSimpleAction *simple, GVariant *parameter,
    gpointer user_data)
{
	PuiApplication	*self = user_data;
	GtkBuilder	*builder;

	if (self->about_dialog == NULL) {
		/* get dialog from builder */
		builder = gtk_builder_new_from_resource("/org"
		    "/guido-berhoerster/code/package-update-indicator"
		    "/pui-about-dialog.ui");

		self->about_dialog = GTK_WIDGET(gtk_builder_get_object(builder,
		    "about-dialog"));

		g_object_unref(builder);
	}

	gtk_dialog_run(GTK_DIALOG(self->about_dialog));
	gtk_widget_hide(self->about_dialog);
}

static void
pui_application_open_preferences(GSimpleAction *simple, GVariant *parameter,
    gpointer user_data)
{
	GDesktopAppInfo	*prefs_app_info;
	GError		*error = NULL;

	prefs_app_info = g_desktop_app_info_new("org.guido-berhoerster.code."
	    "package-update-indicator.preferences.desktop");
	if (prefs_app_info == NULL) {
		g_warning("desktop file \"org.guido-berhoerster.code."
		    "package-update-indicator.preferences.desktop\" not found");
		return;
	}

	if (!g_app_info_launch(G_APP_INFO(prefs_app_info), NULL, NULL,
	    &error)) {
		g_warning("failed to launch preferences: %s", error->message);
		g_error_free(error);
	}
}

static void
pui_application_quit(GSimpleAction *simple, GVariant *parameter,
    gpointer user_data)
{
	PuiApplication	*self = user_data;

	/* quit the GTK main loop if the about dialog is running */
	if (self->about_dialog != NULL) {
		gtk_widget_hide(self->about_dialog);
	}

	g_application_quit(G_APPLICATION(self));
}

static void
pui_application_install_updates(GSimpleAction *simple, GVariant *parameter,
    gpointer user_data)
{
	PuiApplication	*self = user_data;
	GError		*error = NULL;

	if (!g_spawn_command_line_async(self->update_command, &error)) {
		g_warning("failed to run update command: %s", error->message);
		g_error_free(error);
	}
}

static void
update_ui(PuiApplication *self)
{
	GSimpleAction	*install_updates_action;
	guint		important_updates = 0;
	guint		normal_updates = 0;
	gchar		*title = NULL;
	gchar		*body = NULL;
	GApplication	*application = G_APPLICATION(self);
	GNotification	*notification = NULL;

	install_updates_action =
	    G_SIMPLE_ACTION(g_action_map_lookup_action(G_ACTION_MAP(self),
	    "install-updates"));

	if ((self->state == PUI_STATE_NORMAL_UPDATES_AVAILABLE) ||
	    (self->state == PUI_STATE_IMPORTANT_UPDATES_AVAILABLE)) {
		g_object_get(self->backend,
		    "important-updates", &important_updates,
		    "normal-updates", &normal_updates, NULL);
	}

	/* actions */
	switch (self->state) {
	case PUI_STATE_INITIAL:				/* FALLTHGROUGH */
	case PUI_STATE_UP_TO_DATE:			/* FALLTHGROUGH */
	case PUI_STATE_SESSION_RESTART_REQUIRED:	/* FALLTHGROUGH */
	case PUI_STATE_SYSTEM_RESTART_REQUIRED:		/* FALLTHGROUGH */
	case PUI_STATE_ERROR:
		g_simple_action_set_enabled(install_updates_action, FALSE);
		break;
	case PUI_STATE_NORMAL_UPDATES_AVAILABLE:	/* FALLTHROUGH */
	case PUI_STATE_IMPORTANT_UPDATES_AVAILABLE:
		g_simple_action_set_enabled(install_updates_action,
		    program_exists(self->update_command));
		break;
	}

	/* title and body for indicator and notification */
	switch (self->state) {
	case PUI_STATE_INITIAL:
		title = g_strdup("");
		body = g_strdup("");
		break;
	case PUI_STATE_UP_TO_DATE:
		title = g_strdup(_("Up to Date"));
		body = g_strdup(_("The system is up to date."));
		break;
	case PUI_STATE_NORMAL_UPDATES_AVAILABLE:
		title = g_strdup(g_dngettext(NULL, "Software Update",
		    "Software Updates", (gulong)normal_updates));
		if (normal_updates == 1) {
			body = g_strdup(_("There is a software update "
			    "available."));
		} else {
			body = g_strdup_printf(_("There are %u "
			    "software updates available."), normal_updates);
		}
		break;
	case PUI_STATE_IMPORTANT_UPDATES_AVAILABLE:
		title = g_strdup(g_dngettext(NULL, "Important Software Update",
		    "Important Software Updates", (gulong)important_updates));
		if ((normal_updates == 0) && (important_updates == 1)) {
			body = g_strdup(_("There is an important "
			    "software update available."));
		} else if ((normal_updates == 0) && (important_updates > 1)) {
			body = g_strdup_printf(_("There are %u "
			    "important software updates available."),
			    important_updates);
		} else if ((normal_updates > 0) && (important_updates == 1)) {
			body = g_strdup_printf(_("There are %u "
			    "software updates available, "
			    "one of them is important."),
			    normal_updates + important_updates);
		} else {
			body = g_strdup_printf(_("There are %u "
			    "software updates available, "
			    "%u of them are important."),
			    normal_updates + important_updates,
			    important_updates);
		}
		break;
	case PUI_STATE_SESSION_RESTART_REQUIRED:
		title = g_strdup(_("Logout Required"));
		body = g_strdup(_("You need to log out and back in for the "
		    "update to take effect."));
		break;
	case PUI_STATE_SYSTEM_RESTART_REQUIRED:
		title = g_strdup(_("Restart Required"));
		body = g_strdup(_("The computer has to be restarted for the "
		    "updates to take effect."));
		break;
	case PUI_STATE_ERROR:
		title = g_strdup(self->error_message);
		break;
	}

	/* indicator */
	switch (self->state) {
	case PUI_STATE_INITIAL:
		app_indicator_set_status(self->indicator,
		    APP_INDICATOR_STATUS_PASSIVE);
		break;
	case PUI_STATE_UP_TO_DATE:			/* FALLTHGROUGH */
	case PUI_STATE_NORMAL_UPDATES_AVAILABLE:	/* FALLTHGROUGH */
	case PUI_STATE_IMPORTANT_UPDATES_AVAILABLE:	/* FALLTHGROUGH */
	case PUI_STATE_SESSION_RESTART_REQUIRED:	/* FALLTHGROUGH */
	case PUI_STATE_SYSTEM_RESTART_REQUIRED:		/* FALLTHGROUGH */
	case PUI_STATE_ERROR:
		app_indicator_set_status(self->indicator,
		    APP_INDICATOR_STATUS_ACTIVE);
		break;
	}
	app_indicator_set_icon_full(self->indicator, icon_names[self->state],
	    title);

	/* notification */
	switch (self->state) {
	case PUI_STATE_INITIAL:				/* FALLTHGROUGH */
	case PUI_STATE_UP_TO_DATE:			/* FALLTHGROUGH */
	case PUI_STATE_ERROR:
		/* withdraw exisiting notification */
		g_application_withdraw_notification(application,
		    "package-updates-or-restart-required");
		break;
	case PUI_STATE_NORMAL_UPDATES_AVAILABLE:	/* FALLTHGROUGH */
	case PUI_STATE_IMPORTANT_UPDATES_AVAILABLE:	/* FALLTHGROUGH */
	case PUI_STATE_SESSION_RESTART_REQUIRED:	/* FALLTHGROUGH */
	case PUI_STATE_SYSTEM_RESTART_REQUIRED:
		/* create notification */
		notification = g_notification_new(title);
		g_notification_set_body(notification, body);
		g_notification_set_icon(notification, self->icons[self->state]);
		g_notification_set_priority(notification,
		    G_NOTIFICATION_PRIORITY_NORMAL);
		if (g_action_get_enabled(G_ACTION(install_updates_action))) {
			g_notification_add_button(notification,
			    _("Install Updates"),
			    "app.install-updates");
		}
		g_application_send_notification(application,
		    "package-updates-or-restart-required", notification);
		break;
	}

	if (notification != NULL) {
		g_object_unref(notification);
	}

	g_debug("indicator icon: %s, notification title: \"%s\", "
	    "notification body: \"%s\"", icon_names[self->state], title, body);

	g_free(body);
	g_free(title);
}

static void
transition_state(PuiApplication *self)
{
	PuiState	state = self->state;
	PuiRestart	restart_type;
	guint		important_updates;
	guint		normal_updates;
	gchar		*old_state;
	gchar		*new_state;

	switch (self->state) {
	case PUI_STATE_INITIAL:				/* FALLTHROUGH */
	case PUI_STATE_UP_TO_DATE:			/* FALLTHROUGH */
	case PUI_STATE_NORMAL_UPDATES_AVAILABLE:	/* FALLTHROUGH */
	case PUI_STATE_IMPORTANT_UPDATES_AVAILABLE:
		if (self->error_message != NULL) {
			state = PUI_STATE_ERROR;
			break;
		}

		g_object_get(self->backend, "restart-type", &restart_type,
		    "important-updates", &important_updates,
		    "normal-updates", &normal_updates, NULL);
		if (restart_type == PUI_RESTART_SESSION) {
			state = PUI_STATE_SESSION_RESTART_REQUIRED;
		} else if (restart_type == PUI_RESTART_SYSTEM) {
			state = PUI_STATE_SYSTEM_RESTART_REQUIRED;
		} else if (important_updates > 0) {
			state = PUI_STATE_IMPORTANT_UPDATES_AVAILABLE;
		} else if (normal_updates > 0) {
			state = PUI_STATE_NORMAL_UPDATES_AVAILABLE;
		} else {
			state = PUI_STATE_UP_TO_DATE;
		}
		break;
	case PUI_STATE_SESSION_RESTART_REQUIRED:
		g_object_get(self->backend, "restart-type", &restart_type,
		    NULL);
		if (restart_type == PUI_RESTART_SYSTEM) {
			state = PUI_STATE_SYSTEM_RESTART_REQUIRED;
		}
		break;
	case PUI_STATE_SYSTEM_RESTART_REQUIRED:		/* FALLTHROUGH */
	case PUI_STATE_ERROR:
		break;
	}

	if (state != self->state) {
		old_state = pui_types_enum_to_string(PUI_TYPE_STATE,
		    self->state);
		new_state = pui_types_enum_to_string(PUI_TYPE_STATE, state);
		g_debug("state %s -> %s", old_state, new_state);

		self->state = state;
		update_ui(self);

		g_free(new_state);
		g_free(old_state);
	}
}

static void
on_backend_restart_required(PuiBackend *backend, gpointer user_data)
{
	PuiApplication	*self = user_data;

	restart = TRUE;
	g_action_group_activate_action(G_ACTION_GROUP(G_APPLICATION(self)),
	    "quit", NULL);
}

static void
on_backend_state_changed(PuiBackend *backend, gpointer user_data)
{
	PuiApplication	*self = user_data;

	transition_state(self);
}

static void
on_pui_backend_finished(GObject *source_object, GAsyncResult *result,
    gpointer user_data)
{
	PuiApplication	*self = user_data;
	GError		*error = NULL;

	self->backend = pui_backend_new_finish(result, &error);
	if (self->backend == NULL) {
		g_warning("failed to instantiate backend: %s", error->message);
		g_free(self->error_message);
		g_error_free(error);
		self->error_message = g_strdup(_("Update notifications "
		    "are not supported."));
		transition_state(self);
		return;
	}

	pui_backend_set_proxy(self->backend, g_getenv("http_proxy"),
	    g_getenv("https_proxy"), g_getenv("ftp_proxy"),
	    g_getenv("socks_proxy"), g_getenv("no_proxy"), NULL);

	g_settings_bind(self->settings, "refresh-interval", self->backend,
	    "refresh-interval", G_SETTINGS_BIND_GET);
	g_settings_bind(self->settings, "use-mobile-connection", self->backend,
	    "use-mobile-connection", G_SETTINGS_BIND_GET);

	transition_state(self);

	g_signal_connect(self->backend, "restart-required",
	    G_CALLBACK(on_backend_restart_required), self);
	g_signal_connect(self->backend, "state-changed",
	    G_CALLBACK(on_backend_state_changed), self);
}

static void
pui_application_startup(GApplication *application)
{
	PuiApplication	*self = PUI_APPLICATION(application);
	gsize		i;
	GtkBuilder	*builder;
	GtkWidget	*menu;

	G_APPLICATION_CLASS(pui_application_parent_class)->startup(application);

	/* create actions */
	g_action_map_add_action_entries(G_ACTION_MAP(self),
	    pui_application_actions, G_N_ELEMENTS(pui_application_actions),
	    self);

	/* load icons */
	for (i = 0; i < G_N_ELEMENTS(self->icons); i++) {
		self->icons[i] = g_themed_icon_new(icon_names[i]);
	}

	/* create settings */
	self->settings = pui_settings_new();
	g_settings_bind(self->settings, "update-command", self,
	    "update-command", G_SETTINGS_BIND_GET);

	/* start instantiating backend */
	pui_backend_new_async(self->cancellable, on_pui_backend_finished, self);

	/* create indicator */
	self->indicator = app_indicator_new(APPLICATION_ID,
	    "system-software-update",
	    APP_INDICATOR_CATEGORY_APPLICATION_STATUS);
	app_indicator_set_title(self->indicator, _("Package Update Indicator"));

	/* get menu from builder and add it to the indicator */
	builder = gtk_builder_new_from_resource("/org/guido-berhoerster/code/"
	    "package-update-indicator/pui-menu.ui");
	menu = GTK_WIDGET(gtk_builder_get_object(builder, "menu"));
	gtk_widget_insert_action_group(menu, "app", G_ACTION_GROUP(self));
	gtk_widget_show_all(menu);
	app_indicator_set_menu(self->indicator, GTK_MENU(menu));

	update_ui(self);

	/* keep GApplication running */
	g_application_hold(application);

	g_object_unref(builder);
}

static void
pui_application_shutdown(GApplication *application)
{
	GApplicationClass *application_class =
	    G_APPLICATION_CLASS(pui_application_parent_class);

	application_class->shutdown(application);
}

static gint
pui_application_handle_local_options(GApplication *application,
    GVariantDict *options)
{
	gchar		*messages_debug;
	gchar		**args = NULL;
	GError		*error = NULL;

	/* filename arguments are not allowed */
	if (g_variant_dict_lookup(options, G_OPTION_REMAINING, "^a&ay",
	    &args)) {
		g_printerr("invalid argument: \"%s\"\n", args[0]);
		g_free(args);
		return (1);
	}

	if (g_variant_dict_contains(options, "version")) {
		g_print("%s %s\n", PACKAGE, VERSION);

		/* quit */
		return (0);
	}

	if (g_variant_dict_contains(options, "debug")) {
		/* enable debug logging */
		messages_debug = g_strjoin(":", G_LOG_DOMAIN,
		    g_getenv("G_MESSAGES_DEBUG"), NULL);
		g_setenv("G_MESSAGES_DEBUG", messages_debug, TRUE);
		g_free(messages_debug);
	}

	/*
	 * register with the session bus so that it is possible to discern
	 * between remote and primary instance and that remote actions can be
	 * invoked, this causes the startup signal to be emitted which, in case
	 * of the primary instance, starts to instantiate the
	 * backend with the given values
	 */
	if (!g_application_register(application, NULL, &error)) {
		g_critical("g_application_register: %s", error->message);
		g_error_free(error);
		return (1);
	}

	if (g_variant_dict_contains(options, "quit")) {
		/* only valid if a remote instance is running */
		if (!g_application_get_is_remote(application)) {
			g_printerr("%s is not running\n", g_get_prgname());
			return (1);
		}

		/* signal remote instance to quit */
		g_action_group_activate_action(G_ACTION_GROUP(application),
		    "quit", NULL);

		/* quit local instance */
		return (0);
	}

	/* proceed with default command line processing */
	return (-1);
}

static void
pui_application_activate(GApplication *application) {
	GApplicationClass *application_class =
	    G_APPLICATION_CLASS(pui_application_parent_class);

	/* do nothing, implementation required by GApplication */

	application_class->activate(application);
}

static void
pui_application_set_property(GObject *object, guint property_id,
    const GValue *value, GParamSpec *pspec)
{
	PuiApplication	*self = PUI_APPLICATION(object);

	switch (property_id) {
	case PROP_UPDATE_COMMAND:
		g_free(self->update_command);
		self->update_command = g_value_dup_string(value);
		g_debug("property \"update-command\" set to \"%s\"",
		    self->update_command);
		break;
	default:
		G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property_id, pspec);
		break;
	}
}

static void
pui_application_get_property(GObject *object, guint property_id, GValue *value,
    GParamSpec *pspec)
{
	PuiApplication	*self = PUI_APPLICATION(object);

	switch (property_id) {
	case PROP_UPDATE_COMMAND:
		g_value_set_string(value, self->update_command);
		break;
	default:
		G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property_id, pspec);
		break;
	}
}

static void
pui_application_dispose(GObject *object)
{
	PuiApplication	*self = PUI_APPLICATION(object);
	gsize		i;

	if (self->settings != NULL) {
		g_signal_handlers_disconnect_by_data(self->settings, self);
		g_clear_object(&self->settings);
	}

	if (self->cancellable != NULL) {
		g_cancellable_cancel(self->cancellable);
		g_clear_object(&self->cancellable);
	}

	if (self->backend != NULL) {
		g_clear_object(&self->backend);
	}

	if (self->indicator != NULL) {
		g_clear_object(&self->indicator);
	}

	if (self->about_dialog != NULL) {
		g_clear_pointer(&self->about_dialog,
		    (GDestroyNotify)(gtk_widget_destroy));
	}

	for (i = 0; i < G_N_ELEMENTS(self->icons); i++) {
		if (self->icons[i] != NULL) {
			g_clear_object(&self->icons[i]);
		}
	}

	G_OBJECT_CLASS(pui_application_parent_class)->dispose(object);
}

static void
pui_application_finalize(GObject *object)
{
	PuiApplication	*self = PUI_APPLICATION(object);

	g_free(self->update_command);
	g_free(self->error_message);

	G_OBJECT_CLASS(pui_application_parent_class)->finalize(object);
}

static void
pui_application_class_init(PuiApplicationClass *klass)
{
	GObjectClass	*object_class = G_OBJECT_CLASS(klass);
	GApplicationClass *application_class = G_APPLICATION_CLASS(klass);

	object_class->set_property = pui_application_set_property;
	object_class->get_property = pui_application_get_property;
	object_class->dispose = pui_application_dispose;
	object_class->finalize = pui_application_finalize;

	properties[PROP_UPDATE_COMMAND] = g_param_spec_string("update-command",
	    "Update command", "Command for installing updates", NULL,
	    G_PARAM_READWRITE);

	g_object_class_install_properties(object_class, PROP_LAST, properties);

	application_class->startup = pui_application_startup;
	application_class->shutdown = pui_application_shutdown;
	application_class->handle_local_options =
	    pui_application_handle_local_options;
	application_class->activate = pui_application_activate;
}

static void
pui_application_init(PuiApplication *self)
{
	g_application_add_main_option_entries(G_APPLICATION(self),
	    cmd_options);

	self->cancellable = g_cancellable_new();
}

PuiApplication *
pui_application_new(void)
{
	return (g_object_new(PUI_TYPE_APPLICATION, "application-id",
	    APPLICATION_ID, NULL));
}
