# $NetBSD$

GITHUB_PROJECT=	Gource
DISTNAME=	gource-0.51
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=acaudwell/}
GITHUB_RELEASE=	${DISTNAME}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://gource.io/
COMMENT=	software version control visualization
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_TOOLS+=	perl pkg-config
USE_LANGUAGES=	c c++

REPLACE_PERL+=  scripts/gource-ps.pl

#CONFIGURE_ARGS+=  --enable-ttf-font-dir

.include "../../devel/pcre/buildlink3.mk"
.include "../../graphics/SDL2_image/buildlink3.mk"
.include "../../graphics/glew/buildlink3.mk"
BUILDLINK_API_DEPENDS.png+=	png>=1.2.4
.include "../../graphics/png/buildlink3.mk"
BUILDLINK_API_DEPENDS.freetype2+=       freetype2>=2.8.
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
