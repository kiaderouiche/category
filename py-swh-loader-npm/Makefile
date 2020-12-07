# $NetBSD$

DISTNAME=	swh.loader.npm-0.0.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/46/c9/bd1492a819f69476fef211c293c720511395db83071a9b77870ad82423d8/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-loader-npm.git
COMMENT=	Software Heritage loader for npm packages
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	# TODO: python-dateutil>=0
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-chardet>=0:../../converters/py-chardet
DEPENDS+=	# TODO: swh.model>=0.0.28
DEPENDS+=	# TODO: swh.storage>=0.0.143
DEPENDS+=	# TODO: swh.scheduler>=0
DEPENDS+=	# TODO: swh.loader.core>=0.0.40
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	# TODO: requests_mock>=0
TEST_DEPENDS+=	# TODO: swh.core[http]>=0.0.61

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
