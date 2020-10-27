# $NetBSD$

GITHUB_PROJECT=	SpaceVim
GITHUB_TAG=	v1.5.0
DISTNAME=	v1.5.0
PKGNAME=	${GITHUB_PROJECT:tl}-${DISTNAME:S,^v,,}
CATEGORIES=	editors
MASTER_SITES=	${MASTER_SITE_GITHUB:=SpaceVim/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/SpaceVim/SpaceVim/
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/SpaceVim-1.5.0

USE_LANGUAGES=	c c++
USE_TOOLS+=	bash gmake

.include "../../mk/bsd.pkg.mk"
