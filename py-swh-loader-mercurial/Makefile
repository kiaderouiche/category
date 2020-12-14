# $NetBSD$

DISTNAME=	swh.loader.mercurial-0.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.loader.mercurial/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDHG/
COMMENT=	Software Heritage Mercurial Loader
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-billiard>=0:../../parallel/py-billiard
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: patool>=0
DEPENDS+=	# TODO: python-dateutil>=0
DEPENDS+=	# TODO: python-hglib>=0
DEPENDS+=	py-retrying>=0:../../wip/py-retrying
DEPENDS+=	# TODO: sqlitedict>=0
DEPENDS+=	# TODO: swh.model>=0.4.0
DEPENDS+=	# TODO: swh.storage>=0.12.0
DEPENDS+=	# TODO: swh.scheduler>=0.0.39
DEPENDS+=	# TODO: swh.loader.core>=0.5.9

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
