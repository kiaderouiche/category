# $NetBSD$

GITHUB_PROJECT=	spectacle
GITHUB_TAG=	v20.08.1
DISTNAME=	v20.08.1
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://invent.kde.org/graphics/spectacle
COMMENT=	KDE screen capture program
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/spectacle-20.08.1

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../devel/knotifications/builldink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
