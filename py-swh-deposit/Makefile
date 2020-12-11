# $NetBSD$

DISTNAME=	swh.deposit-0.6.0
PKGNAME=	${PYPKGPREFIX}-swh-deposit-0.6.0
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.deposit/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-deposit/
COMMENT=	Software Heritage Deposit Server
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	${PYPKGPREFIX}-click>=0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-xmltodict>=0:../../textproc/py-xmltodict
DEPENDS+=	${PYPKGPREFIX}-iso8601>=0:../../time/py-iso8601
DEPENDS+=	${PYPKGPREFIX}-requests>=0:../../devel/py-requests
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
