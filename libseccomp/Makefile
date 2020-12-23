# $NetBSD$

GITHUB_PROJECT=	libseccomp
DISTNAME=	libseccomp-2.5.1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=seccomp/}
GITHUB_RELEASE=	v2.5.1

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/seccomp/libseccomp/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake pkg-config

PKGCONFIG_OVERRIDE+=	libseccomp.pc.in

.include "../../mk/bsd.pkg.mk"
