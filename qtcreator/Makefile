# $NetBSD$

DISTNAME=	qt-creator-opensource-src-${VERSION}
PKGNAME=	qtcreator-${VERSION}
CATEGORIES=	devel
MASTER_SITES=	http://qtproject.mirror.liquidtelecom.com/official_releases/qtcreator/4.12/4.12.4/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://qtproject.mirror.liquidtelecom.com/official_releases/qtcreator/4.12/4.12.4/
COMMENT=	C++ and QML IDE for Qt development
#LICENSE=	# TODO: (see mk/license.mk)

VERSION=	4.12.4
USE_CMAKE=	yes
USE_LANGUAGES=	c c++


.include "../../lang/python/application.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
#.include "../../x11/qt5-qtdoc/buildlink3.mk"
.include "../../x11/qt5-qtdeclarative/buildlink3.mk"
.include "../../x11/qt5-qtserialport/buildlink3.mk"
.include "../../x11/qt5-qtscript/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../x11/qt5-qtwebchannel/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
