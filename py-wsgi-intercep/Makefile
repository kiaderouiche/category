# $NetBSD$

DISTNAME=	wsgi_intercept-1.9.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	https://files.pythonhosted.org/packages/8b/a2/2dec56a11e174d3ad6397a01118f6d7eaf3cc0fd3387f1b60d0f9df6ff96/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://pypi.python.org/pypi/wsgi_intercept
COMMENT=	Installs a WSGI application in place of a real URI for testing
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
