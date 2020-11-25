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

#ifndef	PUI_APPLICATION_H
#define	PUI_APPLICATION_H

#include <gio/gio.h>
#include <glib-object.h>

G_BEGIN_DECLS

#define	PUI_TYPE_APPLICATION	(pui_application_get_type())

G_DECLARE_FINAL_TYPE(PuiApplication, pui_application, PUI, APPLICATION,
    GApplication)

typedef enum {
    PUI_STATE_INITIAL,
    PUI_STATE_UP_TO_DATE,
    PUI_STATE_NORMAL_UPDATES_AVAILABLE,
    PUI_STATE_IMPORTANT_UPDATES_AVAILABLE,
    PUI_STATE_SESSION_RESTART_REQUIRED,
    PUI_STATE_SYSTEM_RESTART_REQUIRED,
    PUI_STATE_ERROR,
    PUI_STATE_LAST
} PuiState;

PuiApplication *	pui_application_new(void);

G_END_DECLS

#endif /* !PUI_APPLICATION_H */
