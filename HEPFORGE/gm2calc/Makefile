# $NetBSD$

DISTNAME=	gm2calc-1.7.1
GITHUB_PROJECT=	GM2Calc
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=GM2Calc/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/GM2Calc/GM2Calc/
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/GM2Calc-1.7.1

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	cmake/gm2calc.pc.in

.include "../../mk/bsd.pkg.mk"
