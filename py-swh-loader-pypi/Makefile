# $NetBSD$

DISTNAME=	swh.loader.pypi-0.0.9
PKGNAME=	${PYPKGPREFIX}-swh-loader-pypi-0.0.9
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.loader.pypi/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-loader-pypi
COMMENT=	Software Heritage PyPI Loader
LICENSE=	gnu-gpl-v3

DEPENDS+=	${PYPKGPREFIX}-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	${PYPKGPREFIX}-requests>=0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-arrow>=0:../../time/py-arrow
DEPENDS+=	${PYPKGPREFIX}-pkginfo>=0:../../devel/py-pkginfo
DEPENDS+=	${PYPKGPREFIX}-swh.core>=0
DEPENDS+=	${PYPKGPREFIX}-swh.model>=0.0.28
DEPENDS+=	${PYPKGPREFIX}-swh.storage>=0.0.114
DEPENDS+=	${PYPKGPREFIX}-swh.scheduler>=0.0.39
DEPENDS+=	${PYPKGPREFIX}-swh.loader.core>=0.0.37

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
