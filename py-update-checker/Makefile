# $NetBSD$

DISTNAME=	update_checker-0.18.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/5c/0b/1bec4a6cc60d33ce93d11a7bcf1aeffc7ad0aa114986073411be31395c6f/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/bboe/update_checker
COMMENT=	A python module that will check for package updates
#LICENSE=	Simplified BSD License # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	py-black>=0:../../textproc/py-black
BUILD_DEPENDS+=	py-flake8>=0:../../devel/py-flake8
BUILD_DEPENDS+=	# TODO: pytest>=2.7.3
DEPENDS+=	py-requests>=2.3.0:../../devel/py-requests

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
