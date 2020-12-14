# $NetBSD$

DISTNAME=	swh.loader.svn-0.5.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.loader.svn/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDSVN
COMMENT=	Software Heritage Loader SVN
LICENSE=	gnu-gpl-v3

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
