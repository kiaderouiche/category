# $NetBSD$

GITHUB_PROJECT=	ukwm
GITHUB_TAG=	v1.2.0
DISTNAME=	v1.2.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=ukui/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ukui/ukwm/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/ukwm-1.2.0
USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes

PKGCONFIG_OVERRIDE+=	clutter/clutter/ukwm-clutter.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-gles2/ukwm-cogl-gles2.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-pango/ukwm-cogl-pango.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl-path/ukwm-cogl-path.pc.in
PKGCONFIG_OVERRIDE+=	cogl/cogl/ukwm-cogl.pc.in
PKGCONFIG_OVERRIDE+=	src/libukwm.pc.in

.include "../../mk/bsd.pkg.mk"
