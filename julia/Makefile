# $NetBSD$

GITHUB_PROJECT=	julia
DISTNAME=	julia-1.5.2-full
PKGNAME=	${DISTNAME:S/-full//}
CATEGORIES=	lang math
MASTER_SITES=	${MASTER_SITE_GITHUB:=JuliaLang/}
GITHUB_RELEASE=	v1.5.2

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/JuliaLang/julia/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/julia-1.5.2

USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake

.include "../../mk/bsd.pkg.mk"
