# $NetBSD$

DISTNAME=	swh.search-0.2.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.search/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DSEA
COMMENT=	Software Heritage search service
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools-scm>=0
DEPENDS+=	${PYPKGPREFIX}-click>=0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-elasticsearch>=7.0.0,<8.0.0:../../databases/py-elasticsearch
DEPENDS+=	# TODO: swh.core[http]>=0.3.0
DEPENDS+=	# TODO: swh.journal>=0.1.0
DEPENDS+=	# TODO: swh.model>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-test-mock>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
