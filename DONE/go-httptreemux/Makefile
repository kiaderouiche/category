# $NetBSD$

DISTNAME=	httptreemux-5.2.2
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	httptreemux
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=dimfeld/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/dimfeld/httptreemux/
COMMENT=	High-speed, flexible tree-based HTTP router for Go
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/dimfeld/httptreemux

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
