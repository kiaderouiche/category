# $NetBSD$

DISTNAME=	kronometer-2.2.3
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_KDE:=kronometer/2.2.3/src/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=     kamelderouiche@yahoo.com
HOMEPAGE=       https://userbase.kde.org/Kronometer
COMMENT=        Stopwatch application by KDE
LICENSE=        gnu-gpl-v2

BUILD_DEPENDS+= kdoctools>=5.19.0:../../devel/kdoctools

USE_CMAKE=		yes
USE_TOOLS=      msgmerge
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
