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

#ifndef	PUI_COMMON_H
#define	PUI_COMMON_H

G_BEGIN_DECLS

#ifndef	PUI_STARTUP_DELAY
#define	PUI_STARTUP_DELAY		(3 * 60)
#endif /* !PUI_STARTUP_DELAY */

#ifndef	PUI_UPDATES_CHANGED_DELAY
#define	PUI_UPDATES_CHANGED_DELAY	(30)
#endif /* !PUI_UPDATES_CHANGED_DELAY */

#ifndef	PUI_CHECK_UPDATES_INTERVAL
#define	PUI_CHECK_UPDATES_INTERVAL	(60 * 60)
#endif /* !PUI_CHECK_UPDATES_INTERVAL */

#ifndef	PUI_DEFAULT_REFRESH_INTERVAL
#define	PUI_DEFAULT_REFRESH_INTERVAL	(24 * 60 * 60)
#endif /* !PUI_DEFAULT_REFRESH_INTERVAL */

G_END_DECLS

#endif /* !PUI_COMMON_H */
