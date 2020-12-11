# $NetBSD$

DISTNAME=	swh.mirror.forge-0.0.5
PKGNAME=	${PYPKGPREFIX}-swh-mirror-forge-0.0.5
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.mirror.forge/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-mirror-forge/
COMMENT=	Mirror swhs forge to github
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-click>=7.1.2:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-swh-core>=0.10.0:../../wip/py-swh-core

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
