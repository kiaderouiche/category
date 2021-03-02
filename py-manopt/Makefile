# $NetBSD$

DISTNAME=	pymanopt-0.2.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pymanopt/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://www.pymanopt.org/
COMMENT=	Optimization on manifolds with support for automatic differentiation
LICENSE=	modified-bsd

PYTHON_VERSIONS_INCOMPATIBLE+=	27

#DEPENDS+=	${PYPKGPREFIX}-scipy>=1.6.0:../../math/py-scipy

.include "options.mk"

BUILDLINK_API_DEPENDS.py-numpy+=        ${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
