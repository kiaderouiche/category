# $NetBSD$

DISTNAME=	bw2io-0.8.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/4b/a5/002bc3e89d97f9708b2a43e898050369fb8ed8486ba7a26499f2c8c81fa2/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/brightway-lca/brightway2-io
COMMENT=	Tools for importing and export life cycle inventory databases
#LICENSE=	BSD 3-clause # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: bw2calc>=1.7.4
DEPENDS+=	# TODO: bw2data>=3.5.1
DEPENDS+=	# TODO: bw_migrations>=0
DEPENDS+=	py-lxml>=0:../../textproc/py-lxml
DEPENDS+=	# TODO: mrio_common_metadata>=0
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-openpyxl>=0:../../textproc/py-openpyxl
DEPENDS+=	py-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	# TODO: pyprind>=0
DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: stats_arrays>=0
DEPENDS+=	# TODO: unidecode>=0
DEPENDS+=	py-voluptuous>=0:../../wip/py-voluptuous
DEPENDS+=	py-xlrd>=0:../../textproc/py-xlrd
DEPENDS+=	py-xlsxwriter>=0:../../textproc/py-xlsxwriter

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
