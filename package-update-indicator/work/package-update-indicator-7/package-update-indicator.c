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
#include <gtk/gtk.h>
#include <glib/gi18n.h>
#include <locale.h>
#include <stdlib.h>
#include <unistd.h>

#include "pui-application.h"

gboolean	restart;

int
main(int argc, char *argv[])
{
	int		status;
	gchar		*program;
	PuiApplication	*application;

	/* try to obtain the name of the executable for safe re-execution */
	if (argv[0] == NULL) {
		g_error("unable to locate %s executable", PACKAGE);
	}
	if (argv[0][0] != '/') {
		program = g_find_program_in_path(argv[0]);
		if (program == NULL) {
			g_error("unable to locate %s executable", PACKAGE);
		}
		argv[0] = program;
	}

	bindtextdomain(GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
	setlocale(LC_ALL, "");
	bind_textdomain_codeset(GETTEXT_PACKAGE, "UTF-8");
	textdomain(GETTEXT_PACKAGE);

	g_set_application_name(_("Package Update Indicator"));

	gtk_init(&argc, &argv);

	application = pui_application_new();
	status = g_application_run(G_APPLICATION(application), argc, argv);
	g_object_unref(application);

	if (restart) {
		/* application restart requested */
		if (execv(argv[0], argv) == -1) {
			g_error("exec: %s", g_strerror(errno));
		}
	}

	exit(status);
}
