# $NetBSD$

DISTNAME=	ktikz-0.13.1
GITHUB_PROJECT=	ktikz
GITHUB_TAG=	${PKGVERSION_NOREV}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=fhackenberger/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/fhackenberger/ktikz/
COMMENT=	Nice user interface for making pictures using ktikz
#LICENSE=	# TODO: (see mk/license.mk)

USE_CMAKE=		yes
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

BUILD_DEPENDS+= kdoctools>=5.19.0:../../devel/kdoctools

.include "../../devel/ki18n/buildlink3.mk"
.include "../../devel/kparts/buildlink3.mk"
.include "../../devel/ktexteditor/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/kiconthemes/buildlink3.mk"
.include "../../print/poppler-qt5/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kxmlgui/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
