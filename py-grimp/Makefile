# $NetBSD$

DISTNAME=	grimp-1.2.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/1a/bb/fb3195afa1a67c2754a007a21ecdc6f04d67e2db377bf5fae2e468e63299/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://files.pythonhosted.org/packages/1a/bb/fb3195afa1a67c2754a007a21ecdc6f04d67e2db377bf5fae2e468e63299/
COMMENT=	Builds a queryable graph of the imports within one or more Python packages
#LICENSE=	BSD 2-Clause License # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-networkx>=2.1,<3:../../math/py-networkx

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
