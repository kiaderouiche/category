# $NetBSD$

DISTNAME=	presamples-0.2.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/presamples/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/PascalLesage/presamples
COMMENT=	Package to write, load, manage and verify numerical arrays, called presamples
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-bw2calc>=0:../../category/py-bw2calc
DEPENDS+=	py-bw2data>=0:../../category/py-bw2data
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-peewee>=0:../../databases/py-peewee
DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: stats_arrays>=0
DEPENDS+=	py-wrapt>=0:../../devel/py-wrapt

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
