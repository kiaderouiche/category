# $NetBSD$

DISTNAME=	swh.fuse-0.9.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ed/37/8088da90982d0b28840e93e22d669f5d11ce62eb84a56062f2cc237e4e09/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-fuse
COMMENT=	Software Heritage virtual file system
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	# TODO: PyYAML>=0
DEPENDS+=	py-aiosqlite>=0:../../databases/py-aiosqlite
DEPENDS+=	py-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	# TODO: pyfuse3>=0
DEPENDS+=	# TODO: python-daemon>=0
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	# TODO: swh.core>=0.10.0
DEPENDS+=	# TODO: swh.model>=0.7.0
DEPENDS+=	# TODO: swh.web.client>=0.2.3
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	py-requests-mock>=0:../../devel/py-requests-mock

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
