# $NetBSD$

DISTNAME=	whatlanggo-1.0.1
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	whatlanggo
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=abadojack/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/abadojack/whatlanggo/
COMMENT=	Natural language detection library for Go
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/abadojack/whatlanggo

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
