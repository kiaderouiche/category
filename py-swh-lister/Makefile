# $NetBSD$

DISTNAME=	swh.lister-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.lister/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLSGH/
COMMENT=	Software Heritage lister
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	${PYPKGPREFIX}--sqlalchemy>=:../../databases/py-sqlalchemy
DEPENDS+=	${PYPKGPREFIX}-arrow>=0:../../time/py-arrow
DEPENDS+=	${PYPKGPREFIX}-debian>=0.1.38:../../wip/py-debian
DEPENDS+=	${PYPKGPREFIX}-requests>=2.25.0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-xmltodict>=0.12.0:../../textproc/py-xmltodict
DEPENDS+=	${PYPKGPREFIX}-iso8601>=0.1.13:../../time/py-iso8601
DEPENDS+=	${PYPKGPREFIX}-beautifulsoup4>=0:../../www/py-beautifulsoup4
DEPENDS+=	${PYPKGPREFIX}-pytz>=0:../../time/py-pytz
DEPENDS+=	py-launchpadlib>=0:../../wip/py-launchpadlib
#DEPENDS+=	${PYPKGPREFIX}-swh-core>=0.10.0:../../wip/py-swh-core
#DEPENDS+=	${PYPKGPREFIX}-swh-scheduler>=0.4.0:../../wip/py-swh-scheduler
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-requests-mock>=1.8.0:../../
TEST_DEPENDS+=	${PYPKGPREFIX}-sqlalchemy-stubs>=0:../../
TEST_DEPENDS+=	${PYPKGPREFIX}-testing.postgresql>=0:../../

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
