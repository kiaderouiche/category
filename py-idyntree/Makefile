# $NetBSD$

DISTNAME=	idyntree-3.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_PYPI:=i/idyntree/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/robotology/idyntree
COMMENT=	Multibody Dynamics Library designed for Free Floating Robots
LICENSE=	gnu-lgpl-v2.1

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

BUILD_DEPENDS+=	ninja-build>=1.10.2:../../devel/ninja-build
BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
