# $NetBSD$

DISTNAME=	crossbar-20.8.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_PYPI:=c/crossbar/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://crossbar.io/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

devel/py-constantly
DEPENDS+=	${PYPKGPREFIX}-lmdb>=21.2.1:../../databases/py-lmdb
DEPENDS+=	${PYPKGPREFIX}-incremental>=21.2.1:../../devel/py-incremental
devel/flatbuffers
DEPENDS+=	${PYPKGPREFIX}-treq>=0.14.3:../../devel/py-treq
DEPENDS+=	${PYPKGPREFIX}-txaio>=1.0.3:../../devel/py-txaio
DEPENDS+=	${PYPKGPREFIX}-msgpack>=1.15.0:../../devel/py-msgpack
DEPENDS+=	${PYPKGPREFIX}-argon2-cffi>=21.2.1:../../security/py-argon2-cffi
DEPENDS+=	${PYPKGPREFIX}-treq>=0.14.3:../../devel/py-treq
DEPENDS+=	${PYPKGPREFIX}-netaddr>=1.0.3:../../net/py-netaddr
DEPENDS+=	${PYPKGPREFIX}-txtorcon>=1.15.0:../../net/py-txtorcon
wip/py-automata
DEPENDS+=	${PYPKGPREFIX}-scour>=0.38.2:../../wip/py-scour
DEPENDS+=	${PYPKGPREFIX}-argon2-cffi>=21.2.1:../../security/py-argon2-cffi
DEPENDS+=	${PYPKGPREFIX}-passlib>=0.14.3:../../security/py-passlib
textproc/py-mistune
DEPENDS+=	${PYPKGPREFIX}-priority>=1.0.3:../../wip/py-priority
DEPENDS+=	${PYPKGPREFIX}-setproctitle>=1.15.0:../../sysutils/py-setproctitle
DEPENDS+=	${PYPKGPREFIX}-testresources>=2.0.1:../../devel/py-testresources
DEPENDS+=	${PYPKGPREFIX}-ubjson>=0.16.1:../../wip/py-ubjson-0.16.1
DEPENDS+=	${PYPKGPREFIX}-trie3>=0.2:../../wip/py-trie3
DEPENDS+=	${PYPKGPREFIX}-hamcrest>=2.0.2:../../wip/py-hamcrest
DEPENDS+=	${PYPKGPREFIX}-zlmdb>=20.8.1:../../wip/py-zlmdb
DEPENDS+=	www/py-hyperframe
DEPENDS+=	www/py-hyperlink



.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
