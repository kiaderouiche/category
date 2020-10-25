# $NetBSD$

DISTNAME=	google-resumable-media-1.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ef/fa/a16a2e064ebec5e71ed1ee0d9b1547c1e675715082673034efb894a7dfc6/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/googleapis/google-resumable-media-python
COMMENT=	Utilities for Google Media Downloads and Resumable Uploads
LICENSE=	apache-2.0

#FORCE SUPPORT PYTHON3X,
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-google-crc32c>=1.0.0:../../wip/py-google-crc32c

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
