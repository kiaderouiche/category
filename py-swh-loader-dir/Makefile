# $NetBSD$

DISTNAME=	swh.loader.dir-0.0.35
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b3/f3/bcaa6af8ecd803e9e58cd7e0022ad280c0fa0dc7115b364321fc7448f974/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDDIR
COMMENT=	Software Heritage Directory Loader
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-retrying>=0:../../wip/py-retrying
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: swh.model>=0.0.27
DEPENDS+=	# TODO: swh.scheduler>=0.0.39
DEPENDS+=	# TODO: swh.storage>=0.0.83
DEPENDS+=	# TODO: swh.loader.core>=0.0.35

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
