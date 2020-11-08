# $NetBSD$

GITHUB_PROJECT=	julia
DISTNAME=	julia-1.5.2-full
PKGNAME=	${DISTNAME:S/-full//}
CATEGORIES=	lang math
MASTER_SITES=	${MASTER_SITE_GITHUB:=JuliaLang/}
GITHUB_RELEASE=	v1.5.2

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://julialang.org/
COMMENT=	Julia Language: A fresh approach to technical computing
LICENSE=	mit

WRKSRC=		${WRKDIR}/julia-1.5.2

USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
