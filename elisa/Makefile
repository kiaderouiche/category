# $NetBSD$

GITHUB_PROJECT=	elisa
GITHUB_TAG=	v20.08.1
DISTNAME=	v20.08.1
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/elisa/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/elisa-20.08.1

USE_CMAKE=	yes
USE_LANGUAGES=	c++
USE_TOOLS+=	pkg-config

.include "../../sysutils/baloo5/buildlink3.mk"
.include "../../devel/kconfig/buildlink3.mk"
.include "../../multimedia/vlc/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kirigami2/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtmultimedia/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
