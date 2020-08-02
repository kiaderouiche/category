# $NetBSD$

DISTNAME=	shenfun-3.0.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	https://files.pythonhosted.org/packages/fa/bb/5fb28b95d645e784d25732d07fed3854d423299722734f64adc088055e63/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/spectralDNS/shenfun
COMMENT=	TODO: Short description of the package
LICENSE=	2-clause-bsd

USE_LANGUGES=	c c++

DEPENDS+=       ${PYPKGPREFIX}-scipy>=1.4.1:../../math/py-scipy
DEPENDS+=       ${PYPKGPREFIX}-sympy>=1.5.1:../../math/py-sympy

.include "../../devel/py-cython/buildlink3.mk"
BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
