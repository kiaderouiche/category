# $NetBSD$

DISTNAME=	orthopy-0.8.4
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/b5/f1/bf7038a1caed3712eae3f1990c043960224b7f3a8f067ccaa17b7bcba6c4/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/nschloe/orthopy/
COMMENT=	Tools for orthogonal polynomials
#LICENSE=	# TODO: (see mk/license.mk)

USE_LANGUAGES=	# none

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=       ${PYPKGPREFIX}-matplotlib>=3.2.2:../../graphics/py-matplotlib
DEPENDS+=       ${PYPKGPREFIX}-sympy>=1.6.2:../../math/py-sympy

BUILDLINK_API_DEPENDS.py-numpy+=        ${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
