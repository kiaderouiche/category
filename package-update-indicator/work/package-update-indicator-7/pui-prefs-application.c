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

#include <glib/gi18n.h>
#include <gio/gio.h>

#include "pui-prefs-application.h"
#include "pui-settings.h"

#define	COLUMN_REFRESH_INTERVAL	2

struct _PuiPrefsApplication {
	GtkApplication	parent_instance;
	GSettings	*settings;
};

G_DEFINE_TYPE(PuiPrefsApplication, pui_prefs_application, GTK_TYPE_APPLICATION)

static void	pui_prefs_application_quit(GSimpleAction *, GVariant *,
    gpointer);

static const GActionEntry pui_prefs_application_actions[] = {
    { "quit", pui_prefs_application_quit }
};

static void
pui_prefs_application_quit(GSimpleAction *simple, GVariant *parameter,
    gpointer user_data)
{
	PuiPrefsApplication	*self = user_data;

	g_application_quit(G_APPLICATION(self));
}

static gboolean
map_refresh_interval_to_index(GValue *value, GVariant *variant,
    gpointer user_data)
{
	GtkTreeModel	*tree_model = user_data;
	guint32		setting_interval;
	gint		index;
	gboolean	iter_continue;
	GtkTreeIter	iter = { 0 };
	GValue		model_value = G_VALUE_INIT;
	guint		model_interval;

	setting_interval = g_variant_get_uint32(variant);

	/* try to find a matching entry in the list */
	for (iter_continue = gtk_tree_model_get_iter_first(tree_model, &iter),
	    index = 0; iter_continue;
	    iter_continue = gtk_tree_model_iter_next(tree_model, &iter),
	    index++) {
		gtk_tree_model_get_value(tree_model, &iter,
		    COLUMN_REFRESH_INTERVAL, &model_value);
		model_interval = g_value_get_uint(&model_value);
		g_value_unset(&model_value);
		if (setting_interval == model_interval) {
			g_debug("mapping refresh-interval %" G_GUINT32_FORMAT
			    " to index %d", setting_interval, index);
			g_value_set_int(value, index);

			return (TRUE);
		}
	}

	g_debug("mapping refresh-interval %" G_GUINT32_FORMAT " to index -1",
	    setting_interval);
	g_value_set_int(value, -1);

	return (TRUE);
}

static GVariant *
map_index_to_refresh_interval(const GValue *value,
    const GVariantType *expected_type, gpointer user_data)
{
	GtkTreeModel	*tree_model = GTK_TREE_MODEL(user_data);
	gint		index;
	GtkTreeIter	iter = { 0 };
	GValue		model_value = G_VALUE_INIT;
	guint		model_interval;

	index = g_value_get_int(value);
	if (!gtk_tree_model_iter_nth_child(tree_model, &iter, NULL, index)) {
		return (NULL);
	}

	gtk_tree_model_get_value(tree_model, &iter, COLUMN_REFRESH_INTERVAL,
	    &model_value);
	model_interval = g_value_get_uint(&model_value);
	g_debug("mapping index %d to refresh-interval value %" G_GUINT32_FORMAT,
	    index, model_interval);
	g_value_unset(&model_value);

	return (g_variant_new_uint32(model_interval));
}

static void
pui_prefs_application_startup(GApplication *application)
{
	PuiPrefsApplication *self = PUI_PREFS_APPLICATION(application);
	GApplicationClass *application_class =
	    G_APPLICATION_CLASS(pui_prefs_application_parent_class);
	GtkBuilder	*builder;
	GtkWidget	*window;
	GtkTreeModel	*tree_model;
	GtkWidget	*update_command_entry;
	GtkWidget	*refresh_interval_combo_box;
	GtkWidget	*use_mobile_check_button;

	application_class->startup(application);

	/* create actions */
	g_action_map_add_action_entries(G_ACTION_MAP(self),
	    pui_prefs_application_actions,
	    G_N_ELEMENTS(pui_prefs_application_actions), self);

	/* get widgets from builder */
	builder = gtk_builder_new_from_resource("/org/guido-berhoerster/code/"
	    "package-update-indicator/preferences/pui-prefs-window.ui");
	window = GTK_WIDGET(gtk_builder_get_object(builder, "window"));
	gtk_application_add_window(GTK_APPLICATION(self), GTK_WINDOW(window));
	update_command_entry = GTK_WIDGET(gtk_builder_get_object(builder,
	    "update-command"));
	refresh_interval_combo_box = GTK_WIDGET(gtk_builder_get_object(builder,
	    "refresh-interval"));
	tree_model =
	    gtk_combo_box_get_model(GTK_COMBO_BOX(refresh_interval_combo_box));
	use_mobile_check_button = GTK_WIDGET(gtk_builder_get_object(builder,
	    "use-mobile-connection"));

	/* bind settings to widgets */
	self->settings = pui_settings_new();
	g_settings_bind(self->settings, "update-command",
	    update_command_entry, "text", G_SETTINGS_BIND_DEFAULT);
	g_settings_bind_with_mapping(self->settings, "refresh-interval",
	    refresh_interval_combo_box, "active", G_SETTINGS_BIND_DEFAULT,
	    map_refresh_interval_to_index, map_index_to_refresh_interval,
	    tree_model, NULL);
	g_settings_bind(self->settings, "use-mobile-connection",
	    use_mobile_check_button, "active", G_SETTINGS_BIND_DEFAULT);

	/* show window */
	gtk_widget_show(window);
	gtk_window_present(GTK_WINDOW(window));

	g_object_unref(builder);
}

static void
pui_prefs_application_activate(GApplication *application) {
	GtkApplication	*gtk_application = GTK_APPLICATION(application);
	GApplicationClass *application_class =
	    G_APPLICATION_CLASS(pui_prefs_application_parent_class);

	/* raise window when activated */
	gtk_window_present(gtk_application_get_active_window(gtk_application));

	application_class->activate(application);
}

static void
pui_prefs_application_dispose(GObject *object)
{
	PuiPrefsApplication *self = PUI_PREFS_APPLICATION(object);

	if (self->settings != NULL) {
		g_clear_object(&self->settings);
	}

	G_OBJECT_CLASS(pui_prefs_application_parent_class)->dispose(object);
}

static void
pui_prefs_application_class_init(PuiPrefsApplicationClass *klass)
{
	GObjectClass	*object_class = G_OBJECT_CLASS(klass);
	GApplicationClass *application_class = G_APPLICATION_CLASS(klass);

	object_class->dispose = pui_prefs_application_dispose;

	application_class->startup = pui_prefs_application_startup;
	application_class->activate = pui_prefs_application_activate;
}

static void
pui_prefs_application_init(PuiPrefsApplication *self)
{
	/* do nothing, implementation required */
}

PuiPrefsApplication *
pui_prefs_application_new(void)
{
	return (g_object_new(PUI_TYPE_PREFS_APPLICATION,
	    "application-id", APPLICATION_ID, NULL));
}
