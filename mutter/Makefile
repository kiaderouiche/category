# $NetBSD$

DISTNAME=	mutter-3.28.4
CATEGORIES=	x11 gnome
MASTER_SITES=	https://ftp.gnome.org/pub/gnome/sources/mutter/3.28/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://ftp.gnome.org/pub/gnome/sources/mutter/3.28/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes

MESON_ARGS+=            -Dudev=false
MESON_ARGS+=            -Dnative_backend=false
MESON_ARGS+=            -Dlibwacom=false
MESON_ARGS+=            -Dremote_desktop=false
MESON_ARGS+=            -Dprofiler=false
MESON_ARGS+=            -Dwayland=false
MESON_ARGS+=            -Dtests=false #tests require Wayland support                    
MESON_ARGS+=            -Dsm=true


PKGCONFIG_OVERRIDE+=	clutter/clutter/mutter-clutter.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-gles2/mutter-cogl-gles2.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-pango/mutter-cogl-pango.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-path/mutter-cogl-path.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl/mutter-cogl.pc.in
PKGCONFIG_OVERRIDE+=	src/libmutter.pc.in

.include "../../devel/meson/build.mk"
.include "../../mk/bsd.pkg.mk"
