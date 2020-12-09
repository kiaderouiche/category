# $NetBSD$

GITHUB_PROJECT=	Gource
DISTNAME=	gource-0.51
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=acaudwell/}
GITHUB_RELEASE=	${DISTNAME}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/acaudwell/Gource/
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

.include "../../graphics/freetype2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
