# $NetBSD$

DISTNAME=	Gooey-1.0.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/92/fd/a1e8b77a446af66a368d12e6a71c580112c5288d35af66873455de3c044e/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://pypi.python.org/pypi/Gooey/
COMMENT=	Turn (almost) any command line program into a full GUI application with one line
LICENSE=	mit

DEPENDS+=	py-Pillow>=4.3.0:../../graphics/py-Pillow
DEPENDS+=	py-psutil>=5.4.2:../../sysutils/py-psutil
DEPENDS+=	py-colored>=1.3.93:../../textproc/py-colored
DEPENDS+=	# TODO: pygtrie>=2.3.3
DEPENDS+=	# TODO: wxpython==4.1.0>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
