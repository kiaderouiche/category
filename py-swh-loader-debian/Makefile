# $NetBSD$

DISTNAME=	swh.loader.debian-0.0.13
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f0/ff/d52fff2be1c91b772c7ad413de5d608b165adedf7e4aaa79e5864f12fbe6/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDDEB/
COMMENT=	Software Heritage Debian loader
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	# TODO: python-debian>=0
DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	# TODO: swh.core>=0
DEPENDS+=	# TODO: swh.loader.core>=0.0.37
DEPENDS+=	# TODO: swh.model>=0.0.27
DEPENDS+=	# TODO: swh.scheduler>=0.0.39
DEPENDS+=	# TODO: swh.storage[schemata]>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
