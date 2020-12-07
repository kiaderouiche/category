# $NetBSD$

DISTNAME=	swh.deposit-0.6.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/e3/5f/2ba6b5944fbdf495ae0889604c307a238fc735183c2c49b67d3d2c112ccc/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-deposit/
COMMENT=	Software Heritage Deposit Server
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-xmltodict>=0:../../textproc/py-xmltodict
DEPENDS+=	py-iso8601>=0:../../time/py-iso8601
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	# TODO: swh.core[http]>=0.4
DEPENDS+=	# TODO: swh.model>=0.7.2
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	# TODO: pytest-django>=0
TEST_DEPENDS+=	# TODO: pytest-mock>=0
TEST_DEPENDS+=	# TODO: swh.scheduler[testing]>=0
TEST_DEPENDS+=	# TODO: swh.loader.core[testing]>=0
TEST_DEPENDS+=	# TODO: pytest-postgresql>=2.1.0
TEST_DEPENDS+=	# TODO: requests_mock>=0
TEST_DEPENDS+=	# TODO: django-stubs>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
