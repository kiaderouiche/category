# $NetBSD$

DISTNAME=	falkon-3.1.0
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_KDE:=falkon/3.1/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://www.falkon.org/
COMMENT=	Web browser based on Webengine and Qt Framework
LICENSE=	gnu-gpl-v3

.include "../../meta-pkgs/kde/applications.mk"

USE_CMAKE=		yes
USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		pkg-config
USE_LANGUAGES=		c c++

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtwebkit/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
