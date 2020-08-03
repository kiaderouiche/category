# $NetBSD$

DISTNAME=	coreapi-2.3.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	https://files.pythonhosted.org/packages/ca/f2/5fc0d91a0c40b477b016c0f77d9d419ba25fc47cc11a96c825875ddce5a6/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/core-api/python-client
COMMENT=	Python client library for Core API
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: coreschema>=0
DEPENDS+=	${PYPKGPREFIX}-requests>=0:../../devel/py-requests
DEPENDS+=	# TODO: itypes>=0
DEPENDS+=	${PYPKGPREFIX}-uritemplate>=0:../../textproc/py-uritemplate

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
