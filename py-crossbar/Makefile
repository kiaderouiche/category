# $NetBSD$

DISTNAME=	crossbar-20.8.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/crossbar/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://crossbar.io/
COMMENT=	Crossbar.io multi-protocol application router for microservices
LICENSE=	gnu-lgpl-v3


DEPENDS+=	${PYPKGPREFIX}-lmdb>=21.2.1:../../databases/py-lmdb
DEPENDS+=	${PYPKGPREFIX}-constantly>=15.1.0:../../devel/py-constantly
DEPENDS+=	${PYPKGPREFIX}-incremental>=21.2.1:../../devel/py-incremental
DEPENDS+=	${PYPKGPREFIX}-treq>=0.14.3:../../devel/py-treq
DEPENDS+=	${PYPKGPREFIX}-txaio>=1.0.3:../../devel/py-txaio
DEPENDS+=	${PYPKGPREFIX}-msgpack>=1.15.0:../../devel/py-msgpack
DEPENDS+=	${PYPKGPREFIX}-argon2-cffi>=21.2.1:../../security/py-argon2-cffi
DEPENDS+=	${PYPKGPREFIX}-treq>=0.14.3:../../devel/py-treq
DEPENDS+=	${PYPKGPREFIX}-netaddr>=1.0.3:../../net/py-netaddr
DEPENDS+=	${PYPKGPREFIX}-txtorcon>=1.15.0:../../net/py-txtorcon
DEPENDS+=	${PYPKGPREFIX}-automata>=0.1.4:../../wip/py-automata
DEPENDS+=	${PYPKGPREFIX}-scour>=0.38.2:../../wip/py-scour
DEPENDS+=	${PYPKGPREFIX}-argon2-cffi>=21.2.1:../../security/py-argon2-cffi
DEPENDS+=	${PYPKGPREFIX}-passlib>=0.14.3:../../security/py-passlib
DEPENDS+=	${PYPKGPREFIX}-priority>=1.0.3:../../wip/py-priority
DEPENDS+=	${PYPKGPREFIX}-setproctitle>=1.15.0:../../sysutils/py-setproctitle
DEPENDS+=	${PYPKGPREFIX}-testresources>=2.0.1:../../devel/py-testresources
DEPENDS+=	${PYPKGPREFIX}-mistune>=0.8.4:../../textproc/py-mistune
DEPENDS+=	${PYPKGPREFIX}-ubjson>=0.16.1:../../wip/py-ubjson
DEPENDS+=	${PYPKGPREFIX}-trie3>=0.2:../../wip/py-trie3
DEPENDS+=	${PYPKGPREFIX}-hamcrest>=2.0.2:../../wip/py-hamcrest
DEPENDS+=	${PYPKGPREFIX}-zlmdb>=20.8.1:../../wip/py-zlmdb
DEPENDS+=	${PYPKGPREFIX}-hyperframe-6.0.0:../../www/py-hyperframe
DEPENDS+=	${PYPKGPREFIX}-hyperlink-[0-9]*:../../www/py-hyperlink



.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
