# $NetBSD$

DISTNAME=	trio-gtk-3.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	x11 python
MASTER_SITES=	${MASTER_SITE_PYPI:=t/trio-gtk/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/decentral1se/trio-gtk
COMMENT=	Trio guest mode wrapper for PyGTK
LICENSE=	gnu-gpl-v3

DEPENDS+=	${PYPKGPREFIX}-cairo>=01.20:../../graphics/py-cairo
DEPENDS+=	${PYPKGPREFIX}-gobject3>=3.36.1:../../devel/py-gobject3
DEPENDS+=	${PYPKGPREFIX}-trio>=0.17.0:../../wip/py-trio

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
