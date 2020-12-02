# $NetBSD$

DISTNAME=	py2deb-5.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/7c/a8/98976982466aa1e4591c6d7bce51fa3ae9a1ae86a12e2776ccf1b18952ea/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://py2deb.readthedocs.io
COMMENT=	Python to Debian package converter
LICENSE=	mit

DEPENDS+=	py-coloredlogs>=0.5:../../wip/py-coloredlogs
DEPENDS+=	# TODO: deb-pkg-tools>=5.2
DEPENDS+=	py-executor>=21.0:../../wip/py-executor
DEPENDS+=	py-humanfriendly>=8.0:../../wip/py-humanfriendly
DEPENDS+=	# TODO: pip-accel>=0.25,<=0.43
DEPENDS+=	py-pkginfo>=1.1:../../devel/py-pkginfo
DEPENDS+=	py-property-manager>=2.3.1:../../wip/py-property-manager
DEPENDS+=	py-six>=1.6.1:../../lang/py-six

USE_LANGUAGES=	# none
USE_TOOLS+=	gmake

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
