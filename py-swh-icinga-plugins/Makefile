# $NetBSD$

DISTNAME=	swh.icinga_plugins-0.2.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.icinga_plugins/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/swh-icinga-plugins
COMMENT=	Icinga plugins for Software Heritage infrastructure monitoring
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-psycopg2>=0:../../databases/py-psycopg2
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	# TODO: swh.core[http]>=0.3
DEPENDS+=	# TODO: swh.deposit>=0.3
DEPENDS+=	# TODO: swh.storage>=0.0.162
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	# TODO: pytest-mock>=0
TEST_DEPENDS+=	py-requests-mock>=0:../../devel/py-requests-mock

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
