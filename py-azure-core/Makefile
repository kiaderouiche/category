# $NetBSD$

DISTNAME=	azure-core-1.11.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	net python
MASTER_SITES=	https://files.pythonhosted.org/packages/4b/ed/84aa9faebaee51907405c9da4b54c86ab9c1e48ffb9fa3934507bd3871d2/
EXTRACT_SUFX=	.zip

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/core/azure-core
COMMENT=	Microsoft Azure Core Library for Python
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-requests>=2.18.4:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-six>=1.11.0:../../lang/py-six


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
