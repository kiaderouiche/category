# $NetBSD$

DISTNAME=	typing_inspect-0.6.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/84/06/8610d429f5d8d6e145abd0ac6a1a6a120c5f6fcbe174d43ddde549b1c582/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ilevkivskyi/typing_inspect
COMMENT=	Runtime inspection utilities for typing module
LICENSE=	mit

DEPENDS+=	py-mypy_extensions>=0.3.0:../../lang/py-mypy_extensions
DEPENDS+=	py-typing>=3.7.4;python_version<"3.5":../../devel/py-typing
DEPENDS+=	# TODO: typing_extensions>=3.7.4

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
