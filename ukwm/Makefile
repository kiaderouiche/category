# $NetBSD$

DISTNAME=	ukwm_1.1.11.orig
CATEGORIES=	wm
MASTER_SITES=	http://deb.debian.org/debian/pool/main/u/ukwm/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://deb.debian.org/debian/pool/main/u/ukwm/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/ukwm
GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config aclocal autoconf automake autogen
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes

PKGCONFIG_OVERRIDE+=	clutter/clutter/ukwm-clutter.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-gles2/ukwm-cogl-gles2.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-pango/ukwm-cogl-pango.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-path/ukwm-cogl-path.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl/ukwm-cogl.pc.in
PKGCONFIG_OVERRIDE+=	src/libukwm.pc.in

pre-configure:
	cd ${WRKSRC} && ${SH} ./aclocal --force

.include "../../mk/bsd.pkg.mk"
