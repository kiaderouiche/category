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

#define	G_SETTINGS_ENABLE_BACKEND
#include <gio/gsettingsbackend.h>

#include "pui-settings.h"

#define	SETTINGS_ROOT_PATH \
    "/org/guido-berhoerster/code/package-update-indicator/"
#define	SETTINGS_ROOT_GROUP	"General"

GSettings *
pui_settings_new(void)
{
	gchar		*settings_filename;
	GSettingsBackend *settings_backend;

	settings_filename = g_build_filename(g_get_user_config_dir(), PACKAGE,
	    PACKAGE ".conf", NULL);
	settings_backend = g_keyfile_settings_backend_new(settings_filename,
	    SETTINGS_ROOT_PATH, SETTINGS_ROOT_GROUP);

	return (g_settings_new_with_backend(SETTINGS_SCHEMA_ID,
	    settings_backend));
}
