# $NetBSD$

DISTNAME=	trio-gtk-3.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	x11 python
MASTER_SITES=	${MASTER_SITE_PYPI:=t/trio-gtk/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/decentral1se/trio-gtk
COMMENT=	Trio guest mode wrapper for PyGTK
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: pycairo<1.20>=0
DEPENDS+=	# TODO: pygobject<3.32>=0
DEPENDS+=	${PYPKGPREFIX}-trio>=0.17.0,<0.18.0:../../wip/py-trio

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
