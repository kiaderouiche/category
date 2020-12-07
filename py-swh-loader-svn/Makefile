# $NetBSD$

DISTNAME=	swh.loader.svn-0.5.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/8d/d6/30d232ef7b9fc80470b927efe7d3bad3cdbbaaa411e33318b406985e1420/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDSVN
COMMENT=	Software Heritage Loader SVN
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-retrying>=0:../../wip/py-retrying
DEPENDS+=	# TODO: python-dateutil>=0
DEPENDS+=	py-subvertpy>=0.9.4:../../devel/py-subvertpy
DEPENDS+=	# TODO: swh.storage>=0.11.3
DEPENDS+=	# TODO: swh.model>=0.4.0
DEPENDS+=	# TODO: swh.scheduler>=0.0.39
DEPENDS+=	# TODO: swh.loader.core>=0.5.9

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
