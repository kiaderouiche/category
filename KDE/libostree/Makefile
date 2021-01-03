# $NetBSD$

DISTNAME=	libostree-2020.8
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=ostreedev/ostree/releases/download/v2020.8/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ostreedev/ostree/releases/download/v2020.8/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_LANGUAGES=	c c++
GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	src/libostree/ostree-1.pc.in

<<<<<<< HEAD
MAKE_FLAGS+=		CWARNFLAGS.clang=-Wno-error=missing-noreturn
=======
CONFIGURE_ARGS+=	--without-selinux
CONFIGURE_ARGS+=	--without-libmount
CONFIGURE_ARGS+=	--enable-man
>>>>>>> 687cef896 (ADDED PKG/PKGS, SET {LICENSE, CATEGORY, MAINTAINER, HOMEPAGE, COMMENT, MAKEFILE}, ADDED NEW DEPENDENCE/S, DONE PKG/PKGS, MOVE TO DONE, MOVE TO WIP)


CFLAGS=		-Wno-error=implicit-function-declaration

.include "../../archivers/libarchive/buildlink3.mk"
#.include "../../archivers/zlib/buildlink3.mk"
#xz>= 5.0.5
.include "../../archivers/xz/buildlink3.mk"
BUILDLINK_API_DEPENDS.glib2+=   glib2>=2.4.0
.include "../../devel/glib2/buildlink3.mk"
.include "../../filesystems/fuse/buildlink3.mk"
.include "../../net/avahi/buildlink3.mk"
.include "../../net/libsoup/buildlink3.mk"
.include "../../sysutils/e2fsprogs/buildlink3.mk"
.include "../../textproc/gtk-doc/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
