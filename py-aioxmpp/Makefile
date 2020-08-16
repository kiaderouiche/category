# $NetBSD$

DISTNAME=	aioxmpp-0.11.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	net devel
MASTER_SITES=	https://files.pythonhosted.org/packages/dc/0c/987a30bf6d68f9b4ec2bda3ddc0ba7d34c9b0ee5aca91ec3d0f919f18fb2/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/horazont/aioxmpp
COMMENT=	Pure-python XMPP library for asyncio
LICENSE=	gnu-lgpl-v3

DEPENDS+=       ${PYPKGPREFIX}-multidict>=4.7.6:../../databases/py-multidict
DEPENDS+=       ${PYPKGPREFIX}-pyparsing>=2.4.7:../../devel/py-pyparsing
DEPENDS+=       ${PYPKGPREFIX}-aioopenssl>=0.5.1:../../wip/py-aioopenssl
DEPENDS+=       ${PYPKGPREFIX}-aiosasl>=0.4.1:../../wip/py-aiosasl

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
