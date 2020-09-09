# $NetBSD$

DISTNAME=	einsteinpy-0.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/c2/c6/90a6fc15bca165d764a9b04ac716551e594c49df420fc607af98c0a4b61a/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://einsteinpy.org/
COMMENT=	Python package for General Relativity
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX-numba>=0.51.0:../../graphics/py-sphinx
DEPENDS+=	${PYPKGPREFIX-numba>=0.51.0:../../math/py-sphinx
DEPENDS+=	${PYPKGPREFIX-scipy>=1.5.2:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX-sympy>=1.5.1:../../math/py-sympy
#DEPENDS+=       ${PYPKGPREFIX-sstropy>=2.0.2:../../wip/py-astropy
#DEPENDS+=	${PYPKGPREFIX-plotly>=4.8.1:../../wip/py-plotly

.include "../../graphics/py-matplotlib/buildlink3.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
