# $NetBSD$

GITHUB_PROJECT=	Gource
DISTNAME=	gource-0.51
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=acaudwell/}
GITHUB_RELEASE=	${DISTNAME}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/acaudwell/Gource/
COMMENT=	software version control visualization
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_TOOLS+=	perl pkg-config
USE_LANGUAGES=	c c++

.include "../../devel/pcre/buildlink3.mk"
.include "../../graphics/SDL2_image/buildlink3.mk"
BUILDLINK_API_DEPENDS.freetype2+=       freetype2>=2.8.
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
