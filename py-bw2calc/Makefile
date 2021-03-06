# $NetBSD$

DISTNAME=	bw2calc-1.8.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=b/bw2calc/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://bitbucket.org/cmutel/brightway2-calc
COMMENT=	TODO: Short description of the package
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-eight>=0
DEPENDS+=	${PYPKGPREFIX}-scipy>=1.6.0:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-stats-arrays>=0

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
