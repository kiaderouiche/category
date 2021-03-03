# $NetBSD$

DISTNAME=	bw2data-3.6.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/20/cc/65105cdf7597d7aeee92d0dd7ca272f3ab7bec6016aeeae82559815c9b83/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://bitbucket.org/cmutel/brightway2-data
COMMENT=	Tools for the management of inventory databases and impact assessment methods. Part of the Brightway2 LCA Framework
#LICENSE=	3-clause BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-appdirs>=0:../../devel/py-appdirs
DEPENDS+=	# TODO: bw2parameters>=0
DEPENDS+=	py-docopt>=0:../../devel/py-docopt
DEPENDS+=	# TODO: eight>=0
DEPENDS+=	py-fasteners>=0:../../devel/py-fasteners
DEPENDS+=	py-future>=0:../../devel/py-future
DEPENDS+=	py-lxml>=0:../../textproc/py-lxml
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-peewee>=3.9.4:../../databases/py-peewee
DEPENDS+=	py-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	# TODO: pyprind>=0
DEPENDS+=	py-requests>=1.1.0:../../devel/py-requests
DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: stats_arrays>=0
DEPENDS+=	py-unicodecsv>=0:../../databases/py-unicodecsv
DEPENDS+=	py-voluptuous>=0:../../wip/py-voluptuous
DEPENDS+=	# TODO: whoosh>=0
DEPENDS+=	py-wrapt>=0:../../devel/py-wrapt

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
