# $NetBSD$

DISTNAME=	azure-core-1.11.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/4b/ed/84aa9faebaee51907405c9da4b54c86ab9c1e48ffb9fa3934507bd3871d2/
EXTRACT_SUFX=	.zip

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/core/azure-core
COMMENT=	Microsoft Azure Core Library for Python
LICENSE=	mit

DEPENDS+=	py-requests>=2.18.4:../../devel/py-requests
DEPENDS+=	py-six>=1.11.0:../../lang/py-six

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
