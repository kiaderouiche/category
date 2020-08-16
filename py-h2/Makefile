# $NetBSD$

DISTNAME=	h2-3.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/08/0a/033df0fc05fe94f72517ccd393dd9ff99b1773fd198307638e6d3568a518/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/python-hyper/hyper-h2
COMMENT=	HTTP/2 State-Machine based protocol implementation
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-hyperframe>=5.2.0,<6:../../www/py-hyperframe
DEPENDS+=	${PYPKGPREFIX}-hpack>=3.0,<4:../../net/py-hpack

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
