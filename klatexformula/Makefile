# $NetBSD$

DISTNAME=	klatexformula-4.1.0
CATEGORIES=	print
MASTER_SITES=	https://netix.dl.sourceforge.net/project/klatexformula/klatexformula/klatexformula-4.1.0/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://klatexformula.sourceforge.io
COMMENT=	Convert LaTeX formula to image
LICENSE=	gnu-gpl-v2

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qttools/buildlink3.mk"
.include "../../x11/qt5-qtx11extras/buildlink3.mk"
.include "../../x11/qt5-qtxmlpatterns/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
