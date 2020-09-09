# $NetBSD$

DISTNAME=	mys-0.58.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	lang python
MASTER_SITES=	https://files.pythonhosted.org/packages/48/aa/95462bc2d01a8712721336524da2f14f5528fba67cc7dfbce758de8a4589/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/eerimoq/mys
COMMENT=	Strongly typed Python to C++ transpiler
LICENSE=	mit

DEPENDS+=	# TODO: ansicolors>=0
DEPENDS+=	# TODO: humanfriendly>=0
DEPENDS+=	${PYPKGPREFIX}-pygments>=0:../../textproc/py-pygments
DEPENDS+=	${PYPKGPREFIX}-toml>=0:../../textproc/py-toml
DEPENDS+=	# TODO: yaspin>=0

USE_LANGUAGES=	c++

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
