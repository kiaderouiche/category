# $NetBSD$

DISTNAME=	wptserve-3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	https://files.pythonhosted.org/packages/ea/3c/f225d1601cf4bd2a35c0c9b6dcf480ebb037e3cf874f758a0c00bc2b0982/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://wptserve.readthedocs.org/
COMMENT=	Python webserver intended for in web browser testing
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-six>=1.8:../../lang/py-six
DEPENDS+=	# TODO: h2==3.0.1>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
