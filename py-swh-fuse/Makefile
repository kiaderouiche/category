# $NetBSD$

DISTNAME=	swh.fuse-0.9.3
PKGNAME=	${PYPKGPREFIX}-swh-fuse-0.9.3
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.indexer/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-fuse
COMMENT=	Software Heritage virtual file system
LICENSE=	gnu-gpl-v3

PYTHON_VERSIONS_INCOMPATIBLE=	27

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	# TODO: PyYAML>=0
DEPENDS+=	py-aiosqlite>=0:../../databases/py-aiosqlite
DEPENDS+=	py-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	# TODO: pyfuse3>=0
DEPENDS+=	# TODO: python-daemon>=0
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	# TODO: swh.core>=0.10.0
DEPENDS+=	# TODO: swh.model>=0.7.0
DEPENDS+=	# TODO: swh.web.client>=0.2.3

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
