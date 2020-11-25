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

#include "pui-get-updates.h"

typedef struct {
	PkControl	*pk_control;
	PkTask		*pk_task;
	guint		refresh_interval;
} PuiGetUpdates;

GQuark
pui_get_updates_error_quark(void)
{
	return (g_quark_from_static_string("pui-get-updates-error-quark"));
}

static void
on_get_updates_finished(GObject *source_object, GAsyncResult *async_result,
    gpointer user_data)
{
	GTask		*task = user_data;
	PuiGetUpdates *get_updates;
	PkResults	*results = NULL;
	PkError		*pk_error = NULL;
	GError		*error = NULL;
	gint		error_code;
	GPtrArray	*package_list;

	get_updates = g_task_get_task_data(task);

	g_debug("get updates transaction finished");
	results = pk_client_generic_finish(PK_CLIENT(get_updates->pk_task),
	    async_result, &error);
	if (results == NULL) {
		/* pass the error on */
		g_task_return_error(task, error);
		goto out;
	}

	pk_error = pk_results_get_error_code(results);
	if (pk_error != NULL) {
		/* transaction failed, return error */
		g_debug("failed to refresh the cache: %s",
		    pk_error_get_details(pk_error));
		if (pk_error_get_code(pk_error) ==
		    PK_ERROR_ENUM_TRANSACTION_CANCELLED) {
			error_code = PUI_GET_UPDATES_ERROR_CANCELLED;
		} else {
			error_code =
			    PUI_GET_UPDATES_ERROR_GET_UPDATES_FAILED;
		}
		error = g_error_new(PUI_GET_UPDATES_ERROR, error_code,
		    "Failed to get package updates: %s",
		    pk_error_get_details(pk_error));
		g_task_return_error(task, error);
		g_object_unref(pk_error);
		goto out;
	}

	/* return results */
	package_list = pk_results_get_package_array(results);
	g_assert(package_list != NULL);
	g_task_return_pointer(task, package_list,
	    (GDestroyNotify)g_ptr_array_unref);

out:
	if (results != NULL) {
		g_object_unref(results);
	}
	g_object_unref(task);
}

static void
on_refresh_cache_finished(GObject *source_object, GAsyncResult *async_result,
    gpointer user_data)
{
	GTask		*task = user_data;
	PuiGetUpdates *get_updates;
	PkResults	*results = NULL;
	PkClient	*pk_client;
	GError		*error = NULL;
	PkError		*pk_error = NULL;
	gint		error_code;

	get_updates = g_task_get_task_data(task);
	pk_client = PK_CLIENT(get_updates->pk_task);

	g_debug("refresh cache transaction finished");
	results = pk_client_generic_finish(pk_client, async_result, &error);
	if (results == NULL) {
		g_task_return_error(task, error);
		goto out;
	}

	pk_error = pk_results_get_error_code(results);
	if (pk_error != NULL) {
		/* transaction failed, return error */
		g_debug("failed to refresh the cache: %s",
		    pk_error_get_details(pk_error));
		if (pk_error_get_code(pk_error) ==
		    PK_ERROR_ENUM_TRANSACTION_CANCELLED) {
			error_code = PUI_GET_UPDATES_ERROR_CANCELLED;
		} else {
			error_code = PUI_GET_UPDATES_ERROR_REFRESH_FAILED;
		}
		error = g_error_new(PUI_GET_UPDATES_ERROR, error_code,
		    "Failed to refresh the cache: %s",
		    pk_error_get_details(pk_error));
		g_task_return_error(task, error);
		g_object_unref(pk_error);
		goto out;
	}

	/* cache is up to date, get updates */
	pk_client_get_updates_async(pk_client,
	    pk_bitfield_value(PK_FILTER_ENUM_NONE),
	    g_task_get_cancellable(task), NULL, NULL, on_get_updates_finished,
	    task);

out:
	if (results != NULL) {
		g_object_unref(results);
	}
}

static void
on_get_time_since_refresh_finished(GObject *source_object,
    GAsyncResult *async_result, gpointer user_data)
{
	GTask		*task = user_data;
	PuiGetUpdates *get_updates;
	guint		last_refresh;
	GError		*error = NULL;
	PkClient	*pk_client;

	get_updates = g_task_get_task_data(task);
	pk_client = PK_CLIENT(get_updates->pk_task);

	last_refresh =
	    pk_control_get_time_since_action_finish(get_updates->pk_control,
	    async_result, &error);
	if (last_refresh == 0) {
		g_task_return_error(task, error);
		g_object_unref(task);
		return;
	}
	g_debug("time since last cache refresh: %us", last_refresh);

	if (last_refresh > get_updates->refresh_interval) {
		/* cache is out of date, refresh first */
		g_debug("refreshing the cache");
		pk_client_refresh_cache_async(pk_client, FALSE,
		    g_task_get_cancellable(task), NULL, NULL,
		    on_refresh_cache_finished, task);
	} else {
		/* cache is up to date, get updates */
		g_debug("getting updates");
		pk_client_get_updates_async(pk_client,
		    pk_bitfield_value(PK_FILTER_ENUM_NONE),
		    g_task_get_cancellable(task), NULL, NULL,
		    on_get_updates_finished, task);
	}
}

static void
pui_get_updates_free(gpointer data)
{
	PuiGetUpdates *get_updates = data;

	g_object_unref(get_updates->pk_control);
	g_object_unref(get_updates->pk_task);
	g_slice_free(PuiGetUpdates, data);
}

void
pui_get_updates_async(PkControl *pk_control, guint refresh_interval,
    GCancellable *cancellable, GAsyncReadyCallback callback, gpointer user_data)
{
	PuiGetUpdates *get_updates;
	GTask		*task;
	PkClient	*pk_client;

	get_updates = g_slice_new0(PuiGetUpdates);
	get_updates->pk_control = g_object_ref(pk_control);
	get_updates->pk_task = pk_task_new();
	get_updates->refresh_interval = refresh_interval;

	pk_client = PK_CLIENT(get_updates->pk_task);
	pk_client_set_cache_age(pk_client, refresh_interval);
	pk_client_set_background(pk_client, TRUE);

	task = g_task_new(NULL, cancellable, callback, user_data);
	g_task_set_task_data(task, get_updates, pui_get_updates_free);

	/* check whether to refresh the cache before checking for updates */
	g_debug("getting the time since the cache was last refreshed");
	pk_control_get_time_since_action_async(pk_control,
	    PK_ROLE_ENUM_REFRESH_CACHE, cancellable,
	    on_get_time_since_refresh_finished, task);
}

GPtrArray *
pui_get_updates_finish(GAsyncResult *result, GError **errorp)
{
	return (g_task_propagate_pointer(G_TASK(result), errorp));
}
