# $NetBSD$

DISTNAME=	presamples-0.2.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/presamples/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/PascalLesage/presamples
COMMENT=	Package to write, load, manage and verify numerical arrays, called presamples
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-bw2calc>=0:../../category/py-bw2calc
DEPENDS+=	${PYPKGPREFIX}-bw2data>=0:../../category/py-bw2data
DEPENDS+=	${PYPKGPREFIX}-peewee>=0:../../databases/py-peewee
DEPENDS+=	${PYPKGPREFIX}-scipy>=0:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-stats-arrays>=0:../../wip/py-stats-arrays
DEPENDS+=	${PYPKGPREFIX}-wrapt>=0:../../devel/py-wrapt

USE_LANGUAGES=	# none

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
