# $NetBSD$

DISTNAME=	guietta-0.6.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	x11 python
MASTER_SITES=	${MASTER_SITE_PYPI:=g/guietta/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/alfiopuglisi/guietta
COMMENT=	Simple GUI for Python
LICENSE=	mit

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-pyside+=	${PYPKGPREFIX}-pyside>=1.2.4
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
