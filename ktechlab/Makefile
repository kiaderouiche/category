# $NetBSD$

DISTNAME=	ktechlab-0.50.0
GITHUB_PROJECT=	ktechlab
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	cad
MASTER_SITES=	${MASTER_SITE_GITHUB:=ktechlab/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ktechlab/ktechlab/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

DEPENDS+=	kdoctools>=5.19.0:../../devel/kdoctools

.include "../../devel/kparts/buildlink3.mk"
.include "../../devel/ktexteditor/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../sysutils/solid/buildlink3.mk"
.include "../../www/khtml/buildlink3.mk"
.include "../../x11/ktextwidgets/buildlink3.mk"
.include "../../x11/kxmlgui/buildlink3.mk"
.include "../../x11/kwidgetsaddons/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
