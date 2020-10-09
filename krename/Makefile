# $NetBSD$

GITHUB_PROJECT=	krename
GITHUB_TAG=	v5.0.0
DISTNAME=	v5.0.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/krename/
COMMENT=	Utility to handle specialized file renames
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/krename-5.0.0

USE_TOOLS=	pkg-config msgmerge
USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../devel/kio/buildlink3.mk"
BUILDLINK_API_DEPENDS.taglib+=	taglib>=1.0
.include "../../audio/taglib/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../www/kjs/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
