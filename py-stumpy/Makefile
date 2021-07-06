# $NetBSD$

DISTNAME=	stumpy-1.8.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/da/9d/a87f76df8d7739e6aa272d5442414c2d149d34ecddfb227d67895f41c4ef/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/TDAmeritrade/stumpy
COMMENT=	A powerful and scalable library that can be used for a variety of time series data mining tasks
#LICENSE=	BSD-3 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-scipy>=1.5:../../math/py-scipy
DEPENDS+=	py-numba>=0.48:../../math/py-numba
TEST_DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.15
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
