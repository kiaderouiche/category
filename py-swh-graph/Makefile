# $NetBSD$

DISTNAME=	swh.graph-0.2.9
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	graphics python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.graph/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DGRPH
COMMENT=	Software Heritage graph service
LICENSE=	gnu-gpl-v3

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	py-aiohttp>=0:../../www/py-aiohttp
DEPENDS+=	${PYPKGPREFIX}-click>=7.1.2:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-py4j>=0.10.9.1:../../wip/py-py4j
DEPENDS+=	py-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	${PYPKGPREFIX}-swh-core>=0.10.0:../../wip/py-swh-core
DEPENDS+=	${PYPKGPREFIX}-swh-model>=0.7.2:../../wip/py-swh-model
TEST_DEPENDS+=	# TODO: pytest>=0

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
