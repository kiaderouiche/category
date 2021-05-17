# $NetBSD$

DISTNAME=	presamples-0.2.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/presamples/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/PascalLesage/presamples
COMMENT=	Package to write, load, manage and verify numerical arrays
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-bw2calc>=0:../../category/py-bw2calc
DEPENDS+=	${PYPKGPREFIX}-bw2data>=0:../../category/py-bw2data
DEPENDS+=	${PYPKGPREFIX}-peewee>=3.14.4:../../databases/py-peewee
DEPENDS+=	${PYPKGPREFIX}-scipy>=1.5.2:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-wrapt>=1.12.1:../../devel/py-wrapt
DEPENDS+=	${PYPKGPREFIX}-stats-arrays>=0.6.4:../../wip/py-stats-arrays


.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
