# $NetBSD$

DISTNAME=	swh.journal-0.5.1
PKGNAME=	${PYPKGPREFIX}-swh-journal-0.5.1
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.journal/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DJNL/
COMMENT=	Software Heritage Journal utilities
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	py-msgpack>=0:../../devel/py-msgpack
DEPENDS+=	# TODO: tenacity>=0
DEPENDS+=	# TODO: swh.core[db,http]>=0.0.60
DEPENDS+=	# TODO: swh.model>=0.7.2

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
