# $NetBSD$

DISTNAME=	bpytop-1.0.50
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=b/bpytop/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/aristocratos/bpytop
COMMENT=	Shows usage and stats for processor, memory, disks, network and processes
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-psutil>=5.7.0:../../sysutils/py-psutil

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
