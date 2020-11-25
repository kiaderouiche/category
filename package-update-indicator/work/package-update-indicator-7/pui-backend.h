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

#ifndef	PUI_BACKEND_H
#define	PUI_BACKEND_H

#include <gio/gio.h>
#include <glib-object.h>

G_BEGIN_DECLS

#define	PUI_TYPE_BACKEND	(pui_backend_get_type())

#define	PUI_BACKEND_ERROR	(pui_backend_error_quark())

G_DECLARE_FINAL_TYPE(PuiBackend, pui_backend, PUI, BACKEND, GObject)

enum {
    PUI_BACKEND_ERROR_GET_UPDATES_NOT_IMPLEMENTED
};

typedef enum {
    PUI_RESTART_NONE,
    PUI_RESTART_SESSION,
    PUI_RESTART_SYSTEM,
    PUI_RESTART_LAST
} PuiRestart;

GQuark		pui_backend_error_quark(void);
void		pui_backend_new_async(GCancellable *, GAsyncReadyCallback,
    gpointer);
PuiBackend *	pui_backend_new_finish(GAsyncResult *, GError **);
void		pui_backend_set_proxy(PuiBackend *, const gchar *,
    const gchar *, const gchar *, const gchar *, const gchar *, const gchar *);

G_END_DECLS

#endif /* !PUI_BACKEND_H */
