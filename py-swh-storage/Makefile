# $NetBSD$

DISTNAME=	swh.storage-0.18.0
PKGNAME=	${PYPKGPREFIX}-swh-storage-0.18.0
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/cf/8d/cbab620104dfb7e14e117c2e3e3254473f24120438d84833411e5f330652/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DSTO/
COMMENT=	Software Heritage storage manager
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	${PYPKGPREFIX}-click>=0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-flask>=0:../../www/py-flask
DEPENDS+=	${PYPKGPREFIX}-psycopg2>=0:../../databases/py-psycopg2
DEPENDS+=	${PYPKGPREFIX}-aiohttp>=0:../../www/py-aiohttp
DEPENDS+=	${PYPKGPREFIX}-tenacity>=0:../../
DEPENDS+=	${PYPKGPREFIX}-cassandra-driver>=3.19.0,!=3.21.0:../../databases/py-cassandra-driver
DEPENDS+=	${PYPKGPREFIX}-Deprecated>=:../../devel/py-Deprecated
DEPENDS+=	${PYPKGPREFIX}-typing-extensions>=0:../../devel/py-typing-extensions
DEPENDS+=	${PYPKGPREFIX}-mypy_extensions>=0:../../lang/py-mypy_extensions
DEPENDS+=	${PYPKGPREFIX}-iso8601>=0:../../time/py-iso8601
DEPENDS+=	${PYPKGPREFIX}-swh-core[db,http]>=0.5:../../
DEPENDS+=	${PYPKGPREFIX}-swh-model>=0.7.2:../../
DEPENDS+=	${PYPKGPREFIX}-swh-objstorage>=0.2.2:../../

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
