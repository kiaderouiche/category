# $NetBSD$

DISTNAME=	swh.indexer-0.6.3
PKGNAME=	${PYPKGPREFIX}-swh-indexer-0.6.3
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.indexer/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/78/
COMMENT=	Software Heritage Content Indexer
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
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
