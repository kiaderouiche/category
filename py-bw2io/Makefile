# $NetBSD$

DISTNAME=	bw2io-0.8.3.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/e8/98/08cde871d4dbad7d3f67d47ca99374fa20fee6085ab915d43eef0de67cff/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/brightway-lca/brightway2-io
COMMENT=	Tools for importing and export life cycle inventory databases
#LICENSE=	BSD 3-clause # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-bw2calc>=1.7.4:../../category/py-bw2calc
DEPENDS+=	py-bw2data>=3.5.1:../../category/py-bw2data
DEPENDS+=	# TODO: bw_migrations>=0
DEPENDS+=	py-lxml>=0:../../textproc/py-lxml
DEPENDS+=	# TODO: mrio_common_metadata>=0
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-openpyxl>=0:../../textproc/py-openpyxl
DEPENDS+=	py-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	# TODO: pyprind>=0
DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: stats_arrays>=0
DEPENDS+=	py-unidecode>=0:../../wip/py-unidecode
DEPENDS+=	py-voluptuous>=0:../../wip/py-voluptuous
DEPENDS+=	py-xlrd>=0:../../textproc/py-xlrd
DEPENDS+=	py-xlsxwriter>=0:../../textproc/py-xlsxwriter

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
