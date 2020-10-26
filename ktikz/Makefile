# $NetBSD$

GITHUB_PROJECT=	ktikz
GITHUB_TAG=	0.12
DISTNAME=	0.12
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_GITHUB:=fhackenberger/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/fhackenberger/ktikz/
COMMENT=	Nice user interface for making pictures using ktikz
LICENSE=	gnu-gpl-v2

BUILD_DEPENDS+=	kdoctools>=5.19.0:../../devel/kdoctools

WRKSRC=		${WRKDIR}/ktikz-0.12

USE_CMAKE=		yes
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

.include "../../devel/kparts/buildlink3.mk"
.include "../../devel/ktexteditor/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/kiconthemes/buildlink3.mk"
.include "../../print/poppler-qt5/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kxmlgui/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
