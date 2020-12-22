# $NetBSD$

DISTNAME=	godot-1.3.2
PKGNAME=	go-${DISTNAME}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=tetafro/}
GITHUB_PROJECT=	${PKGBASE:S/^go-//}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/tetafro/godot/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/tetafro/godot

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
