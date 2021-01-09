# $NetBSD$

DISTNAME=	go-gotk3-0.5.2
GITHUB_PROJECT=	gotk3
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=gotk3/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/gotk3/gotk3/
COMMENT=	Go bindings for GTK3
LICENSE=	isc

GO_SRCPATH=	github.com/gotk3/gotk3
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}


BUILDLINK_API_DEPENDS.glib2+=	glib2>=2.4.0
.include "../../devel/glib2/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/gdk-pixbuf2/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk3+=    gtk3+>=3.0.0
.include "../../x11/gtk3/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
