# $NetBSD$

DISTNAME=	zlmdb-20.8.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/a2/67/b4c3f62799157eb4e89462c280e0e790600b775e43c985d58000cf4829a0/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/crossbario/zlmdb
COMMENT=	Object-relational zero-copy in-memory database layer for LMDB
LICENSE=	mit

BUILD_DEPENDS+=	# TODO: pytest-runner>=0
DEPENDS+=	# TODO: cbor2>=5.1.0
DEPENDS+=	py-click>=7.0:../../devel/py-click
DEPENDS+=	py-lmdb>=0.98:../../databases/py-lmdb
DEPENDS+=	# TODO: pynacl>=1.3.0
DEPENDS+=	# TODO: pyyaml>=5.3
DEPENDS+=	py-txaio>=20.3.1:../../devel/py-txaio
DEPENDS+=	# TODO: numpy==1.15.4>=0
TEST_DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
