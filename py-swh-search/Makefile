# $NetBSD$

DISTNAME=	swh.search-0.2.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b7/bf/e55939e35b48d1942e682d18b4cc627acdf35576d61896754d37f4fc7a52/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DSEA
COMMENT=	Software Heritage search service
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-elasticsearch>=7.0.0,<8.0.0:../../databases/py-elasticsearch
DEPENDS+=	# TODO: swh.core[http]>=0.3.0
DEPENDS+=	# TODO: swh.journal>=0.1.0
DEPENDS+=	# TODO: swh.model>=0
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	# TODO: pytest-mock>=0
TEST_DEPENDS+=	# TODO: confluent-kafka>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
