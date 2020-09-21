# $NetBSD$

DISTNAME=	pawpyseed-0.6.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/e5/38/e104f182e9eb97bbf5f173fa3cc07739628f862f5de71a541b8192a9616d/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/kylebystrom/pawpyseed
COMMENT=	Parallel C/Python package for NA of PAW DFT wavefunctions
LICENSE=	2-clause-bsd

DEPENDS+=	${PYPKGPREFIX}-matplotlib>=3.2.2:../../graphics/py-matplotlib
#DEPENDS+=	${PYPKGPREFIX}-scipy>=1.4.1:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-sympy>=1.6.2:../../math/py-sympy

.include "../../devel/py-cython/buildlink3.mk"
BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
