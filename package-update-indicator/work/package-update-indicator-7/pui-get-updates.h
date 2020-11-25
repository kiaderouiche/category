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

#ifndef	PUI_GET_UPDATES_H
#define	PUI_GET_UPDATES_H

#include <gio/gio.h>
#include <glib-object.h>
#include <packagekit-glib2/packagekit.h>

G_BEGIN_DECLS

#define	PUI_GET_UPDATES_ERROR	(pui_get_updates_error_quark())

enum {
    PUI_GET_UPDATES_ERROR_REFRESH_FAILED,
    PUI_GET_UPDATES_ERROR_GET_UPDATES_FAILED,
    PUI_GET_UPDATES_ERROR_CANCELLED
};

GQuark		pui_get_updates_error_quark(void);
void		pui_get_updates_async(PkControl *, guint, GCancellable *,
    GAsyncReadyCallback, gpointer);
GPtrArray *	pui_get_updates_finish(GAsyncResult *, GError **);

G_END_DECLS

#endif /* !PUI_GET_UPDATES_H */
