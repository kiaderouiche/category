# $NetBSD$

DISTNAME=	azure-storage-blob-12.7.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	net python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/azure-storage-blob/}
EXTRACT_SUFX=	.zip

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/storage/azure-storage-blob
COMMENT=	Microsoft Azure Blob Storage Client Library for Python
LICENSE=	mit

DEPENDS+=	# TODO: azure-core<2.0.0,>=1.10.0
DEPENDS+=	# TODO: msrest>=0.6.18
DEPENDS+=	py-cryptography>=2.1.4:../../security/py-cryptography

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
