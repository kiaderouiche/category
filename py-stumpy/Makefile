# $NetBSD$

DISTNAME=	stumpy-1.8.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/stumpy/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/TDAmeritrade/stumpy
COMMENT=	Powerful and scalable library for time series data mining tasks
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-scipy>=1.5:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-numba>=0.48:../../math/py-numba
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=0:../../devel/py-test


BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.15
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
