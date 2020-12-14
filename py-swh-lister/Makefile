# $NetBSD$

DISTNAME=	swh.lister-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.lister/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLSGH/
COMMENT=	Software Heritage lister
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	# TODO: SQLAlchemy>=0
DEPENDS+=	${PYPKGPREFIX}-arrow>=0:../../time/py-arrow
DEPENDS+=	${PYPKGPREFIX}-debian>=0
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-xmltodict>=0:../../textproc/py-xmltodict
DEPENDS+=	${PYPKGPREFIX}-iso8601>=0.1.13:../../time/py-iso8601
DEPENDS+=	py-beautifulsoup4>=0:../../www/py-beautifulsoup4
DEPENDS+=	py-pytz>=0:../../time/py-pytz
DEPENDS+=	py-launchpadlib>=0:../../wip/py-launchpadlib
#DEPENDS+=	${PYPKGPREFIX}-swh-core>=0.10.0:../../wip/py-swh-core
#DEPENDS+=	${PYPKGPREFIX}-swh-scheduler>=0.4.0:../../wip/py-swh-scheduler
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	# TODO: requests_mock>=0
TEST_DEPENDS+=	# TODO: sqlalchemy-stubs>=0
TEST_DEPENDS+=	# TODO: testing.postgresql>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
