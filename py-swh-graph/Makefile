# $NetBSD$

DISTNAME=	swh.graph-0.2.9
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	graphics python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.graph/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DGRPH
COMMENT=	Software Heritage graph service
LICENSE=	gnu-gpl-v3

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-aiohttp>=0:../../www/py-aiohttp
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-py4j>=0:../../wip/py-py4j
DEPENDS+=	py-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	# TODO: swh.core[http]>=0.0.79
DEPENDS+=	# TODO: swh.model>=0
TEST_DEPENDS+=	# TODO: pytest>=0

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
