# $NetBSD$

DISTNAME=	ktechlab-0.50.0
GITHUB_PROJECT=	ktechlab
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	cad
MASTER_SITES=	${MASTER_SITE_GITHUB:=ktechlab/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ktechlab/ktechlab/
COMMENT=	IDE for microcontrollers and electronics
#LICENSE=	# TODO: (see mk/license.mk)

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

DEPENDS+=	kdoctools>=5.19.0:../../devel/kdoctools

BUILDLINK_API_DEPENDS.kcoreaddons+=     kcoreaddons>=5.18.0
.include "../../devel/kcoreaddons/buildlink3.mk"
BUILDLINK_API_DEPENDS.ki18n+=   ki18n>=5.18.0
.include "../../devel/ki18n/buildlink3.mk"
BUILDLINK_API_DEPENDS.kio+=     kio>=5.21.0
.include "../../devel/kio/buildlink3.mk"
.include "../../devel/kparts/buildlink3.mk"
.include "../../devel/ktexteditor/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../sysutils/solid/buildlink3.mk"
.include "../../www/khtml/buildlink3.mk"
.include "../../x11/ktextwidgets/buildlink3.mk"
.include "../../x11/kxmlgui/buildlink3.mk"
BUILDLINK_API_DEPENDS.kwidgetsaddons+=  kwidgetsaddons>=5.18.0
.include "../../x11/kwidgetsaddons/buildlink3.mk"
.include "../../x11/kwindowsystem/buildlink3.mk"
BUILDLINK_API_DEPENDS.qt5-qtbase+=      qt5-qtbase>=5.9.1
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
