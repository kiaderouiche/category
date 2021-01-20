# $NetBSD$

DISTNAME=	go-gg-1.3.0
GITHUB_PROJECT=	gg
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GITHUB:=fogleman/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/fogleman/gg/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=     github.com/fogleman/gg/
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../graphics/go-image/buildlink3.mk"
.include "../../wip/go-freetype/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
