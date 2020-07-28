# $NetBSD$

DISTNAME=	docker-hub-2.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/03/c8/1367bbae2dae2cda827caddf3ca6eeb8e314354e7b538e8cfcf7bae038db/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/amalfra/docker-hub
COMMENT=	Access docker hub from your terminal
LICENSE=	mit

BUILD_DEPENDS+=	# TODO: pytest-runner>=0
BUILD_DEPENDS+=	py-setuptools>=38.6.0:../../devel/py-setuptools
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-tabulate>=0:../../textproc/py-tabulate
DEPENDS+=	# TODO: python-dateutil>=0
TEST_DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
