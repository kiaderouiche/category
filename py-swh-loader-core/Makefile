# $NetBSD$

DISTNAME=	swh.loader.core-0.15.0
PKGNAME=	${PYPKGPREFIX}-swh-loader-core-0.15.0
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.loader.core/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDBASE
COMMENT=	Software Heritage Base Loader
LICENSE=	gnu-gpl-v3

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	${PYPKGPREFIX}-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	${PYPKGPREFIX}-requests>=0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-iso8601>=0:../../time/py-iso8601
DEPENDS+=	${PYPKGPREFIX}-pkginfo>=0:../../devel/py-pkginfo
DEPENDS+=	${PYPKGPREFIX}-debian>=0:../../devel/py-debian
DEPENDS+=	${PYPKGPREFIX}-dateutil>=0:../../devel/py-dateutil
DEPENDS+=	${PYPKGPREFIX}-swh-core>=0.10.0:../../wip/py-swh-core
DEPENDS+=	${PYPKGPREFIX}-swh-model>=0.7.2:../../wip/py-swh-model
DEPENDS+=	${PYPKGPREFIX}-swh.objstorage>=0.2.2:../../wip/py-swh-objstorage
DEPENDS+=	${PYPKGPREFIX}-swh.scheduler>=0.4.0:../../devel/py-pkginfo
DEPENDS+=	${PYPKGPREFIX}-swh.storage>=0.13.1:../../devel/py-pkginfo

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
