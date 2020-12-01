# $NetBSD$

DISTNAME=	libostree-2020.8
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=ostreedev/ostree/releases/download/v2020.8/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ostreedev/ostree/releases/download/v2020.8/ # TODO: check
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	src/libostree/ostree-1.pc.in

.include "../../archivers/lzmalib/buildlink3.mk"
BUILDLINK_API_DEPENDS.glib2+=   glib2>=2.4.0
.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
