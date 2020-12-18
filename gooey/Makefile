# $NetBSD$

DISTNAME=	Gooey-1.0.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:tl}
CATEGORIES=	x11 python
MASTER_SITES=	${MASTER_SITE_PYPI:=G/Gooey/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://pypi.python.org/pypi/Gooey/
COMMENT=	Turn (almost) any command line program into a full GUI application with one line
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-Pillow>=4.3.0:../../graphics/py-Pillow
DEPENDS+=	${PYPKGPREFIX}-psutil>=5.4.2:../../sysutils/py-psutil
DEPENDS+=	${PYPKGPREFIX}-colored>=1.3.93:../../textproc/py-colored
#DEPENDS+=	${PYPKGPREFIX}-gtrie>=2.4.1:../../wip/py-gtrie
DEPENDS+=	# TODO: wxpython==4.1.0>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
