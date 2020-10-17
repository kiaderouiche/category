# $NetBSD$

GITHUB_PROJECT=	ktechlab
GITHUB_TAG=	v0.50.0
DISTNAME=	v0.50.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	cad
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/ktechlab/
COMMENT=	IDE for microcontrollers and electronics
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/ktechlab-0.50.0

BUILD_DEPENDS+= kdoctools>=5.19.0:../../devel/kdoctools

USE_CMAKE=	yes
USE_LANGUAGES=	c c++


.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../devel/kparts/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
