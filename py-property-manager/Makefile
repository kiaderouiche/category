# $NetBSD$

DISTNAME=	property-manager-3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/2a/fd/5711b49f570916e166ba3e7f7205d43b0fb94b4c3e842545c7be8c6efe32/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://property-manager.readthedocs.io
COMMENT=	Useful property variants for Python programming (required properties, writable properties, cached properties, etc)
LICENSE=	mit

DEPENDS+=	# TODO: humanfriendly>=8.0
DEPENDS+=	# TODO: verboselogs>=1.1
TEST_DEPENDS+=	py-coloredlogs>=5.0:../../category/py-coloredlogs
TEST_DEPENDS+=	# TODO: pytest-cov>=2.2.1
TEST_DEPENDS+=	# TODO: pytest>=2.6.1

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
