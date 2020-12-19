# $NetBSD$

DISTNAME=	swh.fuse-0.9.3
PKGNAME=	${PYPKGPREFIX}-swh-fuse-0.9.3
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.fuse/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-fuse
COMMENT=	Software Heritage virtual file system
LICENSE=	gnu-gpl-v3

PYTHON_VERSIONS_INCOMPATIBLE+=	27

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	${PYPKGPREFIX}-aiosqlite>=0:../../databases/py-aiosqlite
#DEPENDS+=	${PYPKGPREFIX}-fuse3>=0:../../
DEPENDS+=	${PYPKGPREFIX}-daemon>=2.2.4:../../devel/py-daemon
DEPENDS+=	${PYPKGPREFIX}-requests>=2.25.0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-psutil>=5.7.3:../../sysutils/py-psutil
DEPENDS+=	${PYPKGPREFIX}-yaml>=5.1:../../textproc/py-yaml
DEPENDS+=	${PYPKGPREFIX}-swh-core>=0.10.0:../../wip/py-swh-core
DEPENDS+=	${PYPKGPREFIX}-swh-model>=0.7.2:../../wip/py-swh-model
DEPENDS+=	# TODO: swh.web.client>=0.2.3

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
