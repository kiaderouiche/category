# $NetBSD$

DISTNAME=	msrest-0.6.21
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/bb/2c/e8ac4f491efd412d097d42c9eaf79bcaad698ba17ab6572fd756eb6bd8f8/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/Azure/msrest-for-python
COMMENT=	AutoRest swagger generator Python client runtime
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-requests>=2.16>=0
DEPENDS+=	${PYPKGPREFIX}-requests_oauthlib>=0.5.0
DEPENDS+=	py-isodate>=0.6.0:../../time/py-isodate
DEPENDS+=	py-certifi>=2017.4.17:../../security/py-certifi

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
