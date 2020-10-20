# $NetBSD$

DISTNAME=	scanapi-2.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/8f/a2/afd3d69f18174499aa220cd73ac6dd8fe6451b6514bda3a17b5d66f24c9a/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://scanapi.dev/
COMMENT=	Automated Testing and Documentation for your REST API
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-appdirs>=1.4.4,<2.0.0:../../devel/py-appdirs
DEPENDS+=	${PYPKGPREFIX}-click==7.1.2>=0
DEPENDS+=	# TODO: curlify==2.2.1>=0
DEPENDS+=	${PYPKGPREFIX}-jinja2==2.11.2>=0
DEPENDS+=	${PYPKGPREFIX}-yaml==5.3.1>=0
DEPENDS+=	${PYPKGPREFIX}-requests==2.24.0>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
