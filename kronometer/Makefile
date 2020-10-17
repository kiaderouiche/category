# $NetBSD$

GITHUB_PROJECT=	kronometer
GITHUB_TAG=	v2.2.3
DISTNAME=	v2.2.3
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/kronometer/
COMMENT=	Stopwatch application by KDE
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/kronometer-2.2.3

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../mk/bsd.pkg.mk"
