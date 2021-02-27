# $NetBSD$

DISTNAME=	azure-storage-blob-12.7.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/62/c5/2ded1eafb82fe093c9f18db071755288cd646ed02bc87abd160d4b2c23ae/
EXTRACT_SUFX=	.zip

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/storage/azure-storage-blob
COMMENT=	Microsoft Azure Blob Storage Client Library for Python
LICENSE=	mit

DEPENDS+=	# TODO: azure-core<2.0.0,>=1.10.0
DEPENDS+=	# TODO: msrest>=0.6.18
DEPENDS+=	py-cryptography>=2.1.4:../../security/py-cryptography

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
