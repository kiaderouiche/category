# $NetBSD$

DISTNAME=	upower-0.99.11
PKGNAME=	upower-glib-0.99.11
CATEGORIES=	sysutils
MASTER_SITES=	https://upower.freedesktop.org/releases/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://upower.freedesktop.org/releases/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes

PKGCONFIG_OVERRIDE+=	upower-glib.pc.in

.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
