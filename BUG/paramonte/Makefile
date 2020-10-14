# $NetBSD$

GITHUB_PROJECT=	paramonte
GITHUB_TAG=	v1.3.0
DISTNAME=	v1.3.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=cdslaborg/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/cdslaborg/paramonte/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/paramonte-1.3.0

USE_CMAKE=	yes
USE_LANGUAGES=	c c++ fortran

.include "../../mk/bsd.pkg.mk"
