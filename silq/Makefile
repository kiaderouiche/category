# $NetBSD$

GITHUB_PROJECT=	silq
GITHUB_TAG=	pldi2020
DISTNAME=	pldi2020
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	lang math
MASTER_SITES=	${MASTER_SITE_GITHUB:=eth-sri/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://silq.ethz.ch/
COMMENT=	TODO: Short description of the package
LICENSE=	boost-license

WRKSRC=		${WRKDIR}/silq-pldi2020

USE_LANGUAGES=	# none
USE_TOOLS+=	bash:run

DEPENDS+=	ldc>=1.21.0:../../wip/ldc

.include "../../mk/bsd.pkg.mk"
