# $NetBSD$

DISTNAME=	deep_translator-1.3.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/7c/b6/22270463d3f378e5384834ce5ac16a21711cb361bdf19cb551f78bba9b71/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/nidhaloff/deep_translator
COMMENT=	A flexible python tool to translate between different languages in a simple way
LICENSE=	mit

BUILD_DEPENDS+=	# TODO: pytest-runner>=0
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-beautifulsoup4>=0:../../www/py-beautifulsoup4
TEST_DEPENDS+=	# TODO: pytest>=3

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
