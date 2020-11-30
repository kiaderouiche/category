# $NetBSD$

DISTNAME=	zlmdb-20.8.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/a2/67/b4c3f62799157eb4e89462c280e0e790600b775e43c985d58000cf4829a0/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/crossbario/zlmdb
COMMENT=	Object-relational zero-copy in-memory database layer for LMDB
LICENSE=	mit

BUILD_DEPENDS+=	${PYPKGPREFIX}-test-runner>=0
DEPENDS+=	${PYPKGPREFIX}-cbor2>=5.1.0
DEPENDS+=	${PYPKGPREFIX}-click>=7.0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-lmdb>=0.98:../../databases/py-lmdb
DEPENDS+=	${PYPKGPREFIX}-nacl>=1.3.0
DEPENDS+=	${PYPKGPREFIX}-yaml>=5.1:../../textproc/py-yaml
DEPENDS+=	${PYPKGPREFIX}-txaio>=20.3.1:../../devel/py-txaio
DEPENDS+=	${PYPKGPREFIX}-numpy==1.15.4>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=4.3.1:../../devel/py-test

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
