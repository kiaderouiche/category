# $NetBSD$

DISTNAME=	go-gin-1.6.3
GITHUB_PROJECT=	gin
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=gin-gonic/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/gin-gonic/gin/
COMMENT=	Gin is a HTTP web framework written in Go
LICENSE=	mit

GO_SRCPATH=     github.com/gin-gonic/gin
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
