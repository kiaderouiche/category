# $NetBSD$

DISTNAME=	electricpy-0.1.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=e/electricpy/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/engineerjoe440/ElectricPy
COMMENT=	Electrical Engineering Functions in Python
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE+=	27

DEPENDS+=               ${PYPKGPREFIX}-matplotlib>=3.3.3:../../graphics/py-matplotlib
#DEPENDS+=               ${PYPKGPREFIX}-scipy>=1.5.2:../../math/py-scipy
DEPENDS+=               ${PYPKGPREFIX}-sympy>=1.7:../../math/py-sympy
#DEPENDS+=               ${PYPKGPREFIX}-numdifftools>=0.9.39:../../wip/py-numdifftools

BUILDLINK_API_DEPENDS.pynumpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
