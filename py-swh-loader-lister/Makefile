# $NetBSD$

DISTNAME=	swh.lister-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/89/e3/f458426ec6098042d563806138d2d05d2e62c8873d464d7089910ac1e02b/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLSGH/
COMMENT=	Software Heritage lister
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	# TODO: SQLAlchemy>=0
DEPENDS+=	py-arrow>=0:../../time/py-arrow
DEPENDS+=	# TODO: python_debian>=0
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	py-xmltodict>=0:../../textproc/py-xmltodict
DEPENDS+=	py-iso8601>=0:../../time/py-iso8601
DEPENDS+=	py-beautifulsoup4>=0:../../www/py-beautifulsoup4
DEPENDS+=	py-pytz>=0:../../time/py-pytz
DEPENDS+=	py-launchpadlib>=0:../../wip/py-launchpadlib
DEPENDS+=	# TODO: swh.core[db]>=0.9
DEPENDS+=	# TODO: swh.scheduler>=0.8
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	# TODO: requests_mock>=0
TEST_DEPENDS+=	# TODO: sqlalchemy-stubs>=0
TEST_DEPENDS+=	# TODO: testing.postgresql>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
