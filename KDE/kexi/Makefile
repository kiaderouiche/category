# $NetBSD$

DISTNAME=	kexi-3.2.0
CATEGORIES=	databases
MASTER_SITES=	http://ftp.is.co.za/mirror/ftp.kde.org/stable/kexi/src/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=     kamelderouiche@yahoo.com
HOMEPAGE=       http://kexi-project.org/
COMMENT=        Visual database applications creator
LICENSE=        gnu-gpl-v2

.include "../../meta-pkgs/kde/applications.mk"

USE_CMAKE=		yes
USE_PKGLOCALEDIR=	yes
USE_TOOLS+=	pkg-config msgmerge
USE_LANGUAGES=		c c++

DEPENDS+=	doxygen>=1.8.20:../../devel/doxygen

.include "../../archivers/karchive/buildlink3.mk"
.include "../../devel/ki18n/buildlink3.mk"
.include "../../devel/kcrash/buildlink3.mk"
.include "../../devel/kcoreaddons/buildlink3.mk"
.include "../../devel/kio/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/kcodecs/buildlink3.mk"
.include "../../graphics/kiconthemes/buildlink3.mk"
.include "../../misc/marble/buildlink3.mk"
.include "../../x11/kconfigwidgets/buildlink3.mk"
.include "../../x11/kguiaddons/buildlink3.mk"
.include "../../x11/kitemviews/buildlink3.mk"
.include "../../x11/ktextwidgets/buildlink3.mk"
.include "../../x11/kxmlgui/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
