# $NetBSD$

DISTNAME=	swh.indexer-0.6.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/3e/01/3d4febfb8eeb00afe4e024ee6115fcefcaaf20754ed9067f7724bcb90b6c/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/78/
COMMENT=	Software Heritage Content Indexer
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: python-magic>=0.4.13
DEPENDS+=	# TODO: pyld>=0
DEPENDS+=	py-xmltodict>=0:../../textproc/py-xmltodict
DEPENDS+=	py-typing-extensions>=0:../../devel/py-typing-extensions
DEPENDS+=	# TODO: swh.core[db,http]>=0.3
DEPENDS+=	# TODO: swh.model>=0.0.15
DEPENDS+=	# TODO: swh.objstorage>=0.2.2
DEPENDS+=	# TODO: swh.scheduler>=0.5.2
DEPENDS+=	# TODO: swh.storage>=0.12.0
DEPENDS+=	# TODO: swh.journal>=0.1.0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
