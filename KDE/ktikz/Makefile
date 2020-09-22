# $NetBSD$

GITHUB_PROJECT=	ktikz
GITHUB_TAG=	0.12
DISTNAME=	0.12
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_GITHUB:=fhackenberger/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/fhackenberger/ktikz/
COMMENT=	KtikZ provides a nice user interface for making pictures using TikZ
LICENSE=	gnu-gpl-v2

WRKSRC=			${WRKDIR}/ktikz-0.12

USE_CMAKE=		yes
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

.include "../../mk/bsd.pkg.mk"
