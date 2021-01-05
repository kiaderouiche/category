# $NetBSD$

DISTNAME=	pyfuse3-3.1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pyfuse3/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/libfuse/pyfuse3
COMMENT=	Bindings for libfuse 3 with async I/O support
LICENSE=	gnu-lgpl-v3

USE_TOOLS+=	pkg-config

#DEPENDS+=	${PYPKGPREFIX}-trio>=0.17.0:../../wip/py-trio

.include "../../devel/py-cython/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../filesystems/fuse/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
