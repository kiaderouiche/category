# $NetBSD$

DISTNAME=	bw2data-3.6.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=b/bw2data/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://bitbucket.org/cmutel/brightway2-data
COMMENT=	Tools for the management of inventory databases and impact assessment
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-appdirs>=0:../../devel/py-appdirs
DEPENDS+=	${PYPKGPREFIX}-bw2parameters>=0:../../
DEPENDS+=	${PYPKGPREFIX}-docopt>=0:../../devel/py-docopt
DEPENDS+=	${PYPKGPREFIX}-eight2>=0:../../wip/py-eight2
DEPENDS+=	${PYPKGPREFIX}-fasteners>=0:../../devel/py-fasteners
DEPENDS+=	${PYPKGPREFIX}-future>=0:../../devel/py-future
DEPENDS+=	${PYPKGPREFIX}-lxml>=0:../../textproc/py-lxml
DEPENDS+=	${PYPKGPREFIX}-numpy>=0:../../math/py-numpy
DEPENDS+=	${PYPKGPREFIX}-peewee>=3.9.4:../../databases/py-peewee
DEPENDS+=	${PYPKGPREFIX}-sutil>=0:../../sysutils/py-psutil
DEPENDS+=	${PYPKGPREFIX}-prind>=0:../../wip/py-prind
DEPENDS+=	${PYPKGPREFIX}-requests>=1.1.0:../../devel/py-requests
#DEPENDS+=	${PYPKGPREFIX}-scipy>=0:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-stats-arrays>=0:../../wip/py-stats-arrays
DEPENDS+=	${PYPKGPREFIX}-unicodecsv>=0:../../databases/py-unicodecsv
DEPENDS+=	${PYPKGPREFIX}-voluptuous>=0:../../wip/py-voluptuous
DEPENDS+=	${PYPKGPREFIX}-whoosh>=0:../../textproc/py-whoosh
DEPENDS+=	${PYPKGPREFIX}-wrapt>=0:../../devel/py-wrapt


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
