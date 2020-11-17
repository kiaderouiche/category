# $NetBSD$

DISTNAME=	SecretStorage-3.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:tl}
CATEGORIES=	security python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/SecretStorage/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mitya57/secretstorage
COMMENT=	Python bindings to FreeDesktop.org Secret Service API
LICENSE=	modified-bsd

USE_LANGUAGES=	# none

jeepney-0.5.0
cryptography

do-test:
 ${RUN}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
