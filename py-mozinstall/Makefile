# $NetBSD$

DISTNAME=	mozInstall-2.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/0f/13/a1560050203dbbff76930094e0dbdb8418a58c876a943b1327dcb4b18d5c/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wiki.mozilla.org/Auto-tools/Projects/Mozbase
COMMENT=	package for installing and uninstalling Mozilla applications
#LICENSE=	MPL 2.0 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: mozinfo>=0.7
DEPENDS+=	# TODO: mozfile>=1.0
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-six>=1.10.0:../../lang/py-six
TEST_DEPENDS+=	# TODO: mozprocess>=0.15

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
