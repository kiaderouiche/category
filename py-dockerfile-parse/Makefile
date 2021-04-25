# $NetBSD$

DISTNAME=	dockerfile-parse-1.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/70/f3/2da4b506a16aab83096b61c9095e4ebf0a77bd4a2d2a2f8367b323e8141f/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/containerbuildsystem/dockerfile-parse
COMMENT=	Python library for Dockerfile manipulation
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-six>=0:../../lang/py-six
TEST_DEPENDS+=	# TODO: pytest>=4.1.0
TEST_DEPENDS+=	# TODO: pytest-cov>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
