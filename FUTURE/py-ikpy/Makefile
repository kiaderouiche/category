# $NetBSD$

DISTNAME=	ikpy-3.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=i/ikpy/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://pypi.org/project/ikpy
COMMENT=	Inverse kinematics library aiming performance and modularity
#LICENSE=	# TODO: (see mk/license.mk)

PYTHON_VERSIONS_INCOMPATIBLE+=  27

#DEPENDS+=	${PYPKGPREFIX}-scipy>=1.5.2:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-sympy>=1.7:../../math/py-sympy

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
