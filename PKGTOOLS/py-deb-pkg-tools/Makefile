# $NetBSD$

DISTNAME=	deb-pkg-tools-8.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b8/10/010d0dec9c2e5231c1f0e064772c17fb48f7960fd0b2c2fafa55971f2971/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://deb-pkg-tools.readthedocs.io
COMMENT=	Debian packaging tools
LICENSE=	mit

DEPENDS+=	py-coloredlogs>=14.0:../../wip/py-coloredlogs
DEPENDS+=	py-executor>=22.0:../../wip/py-executor
DEPENDS+=	py-humanfriendly>=8.2:../../wip/py-humanfriendly
DEPENDS+=	py-property-manager>=3.0:../../wip/py-property-manager
DEPENDS+=	py-six>=1.10.0:../../lang/py-six

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
