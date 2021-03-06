# $NetBSD$

DISTNAME=	cogent3-2020.12.21a0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	biology python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/cogent3/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/cogent3/cogent3
COMMENT=	COmparative GENomics Toolkit 3
LICENSE=	2-clause-bsd


DEPENDS+=	${PYPKGPREFIX}-tox>=3.20.1:../../devel/py-tox
DEPENDS+=	${PYPKGPREFIX}-Pillow>=6.2.2:../../graphics/py-Pillow
DEPENDS+=	${PYPKGPREFIX}-numba>=0.51.22:../../math/py-numba
#DEPENDS+=	${PYPKGPREFIX}-scipy>=1.5.2:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-psutil>=5.7.3:../../sysutils/py-psutil

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
