# $NetBSD$

GITHUB_PROJECT=	clazy
GITHUB_TAG=	v1.7
DISTNAME=	v1.7
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://apps.kde.org/en/clazy
COMMENT=	Clang plugin for additional warnings
LICENSE=	gnu-lgpl-v2.1

WRKSRC=		${WRKDIR}/clazy-1.7

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../lang/clang/buildlink3.mk"
.include "../../lang/llvm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
