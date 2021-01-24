# $NetBSD$

DISTNAME=	go-oak-2.4.0
GITHUB_PROJECT=	oak
PKGREVISION=	1
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GITHUB:=oakmound/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/oakmound/oak/
COMMENT=	Pure Go game engine
LICENSE=	apache-2.0

GO_SRCPATH=     github.com/oakmound/oak
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../graphics/go-gift/buildlink3.mk"
.include "../../graphics/go-image/buildlink3.mk"
.include "../../wip/go-freetype/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
