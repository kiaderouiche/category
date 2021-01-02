# $NetBSD$

DISTNAME=	go-tunnel-0.0.2
GITHUB_PROJECT=	tunnel
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=kataras/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/kataras/tunnel/
COMMENT=	Public URLs for exposing your local web server 
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=	github.com/kataras/tunnel
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
