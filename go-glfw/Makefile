# $NetBSD$

DISTNAME=	glfw-20201108
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	glfw
GITHUB_TAG=	06ea97f0c265e8f81bc3b76ab51a5e4d66e87c23
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-gl/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/go-gl/glfw
COMMENT=	TODO: Short description of the package
LICENSE=	2-clause-bsd

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/go-gl/${GITHUB_PROJECT}

.include "../../graphics/glfw/buildlink3.mk"
.include "../../x11/libXcursor/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
