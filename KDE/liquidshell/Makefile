# $NetBSD$

GITHUB_PROJECT=	liquidshell
GITHUB_TAG=	v1.7.1
DISTNAME=	v1.7.1
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/liquidshell/
COMMENT=	Basic desktop shell using QtWidgets 
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/liquidshell-1.7.1

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../mk/bsd.pkg.mk"
