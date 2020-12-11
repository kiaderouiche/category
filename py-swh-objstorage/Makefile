# $NetBSD$

DISTNAME=	swh.objstorage-0.2.2
PKGNAME=	${PYPKGPREFIX}-swh-objstorage-0.2.2
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.objstorage/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DOBJS
COMMENT=	Software Heritage Object Storage
LICENSE=	gnu-gpl-v3

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-aiohttp>=3:../../www/py-aiohttp
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: swh.core[http]>=0.3
DEPENDS+=	# TODO: swh.model>=0.0.27

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
