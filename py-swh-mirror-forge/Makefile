# $NetBSD$

DISTNAME=	swh.mirror.forge-0.0.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/84/46/3d6e78a76fdb94f4824a1417e81a115aef4ed2b44046db4727d6c736042e/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-mirror-forge/
COMMENT=	Mirror swhs forge to github
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: swh.core>=0.0.29

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
