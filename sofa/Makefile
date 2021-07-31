# $NetBSD$

DISTNAME=	sofa
PKGNAME=	sofa-210600
GITHUB_PROJECT=	sofa
GITHUB_TAG=	refs/tags/v21.06.00
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=sofa-framework/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://www.sofa-framework.org/
COMMENT=	Multi-physics simulation with an emphasis on medical simulation
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/sofa-21.06.00

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	SofaKernel/modules/Sofa.Testing/extlibs/gtest/cmake/gtest.pc.in
PKGCONFIG_OVERRIDE+=	SofaKernel/modules/Sofa.Testing/extlibs/gtest/cmake/gtest_main.pc.in

.include "../../mk/bsd.pkg.mk"
