# $NetBSD$

DISTNAME=	stacktrace-errors-1.1.1
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	errors
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-errors/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/go-errors/errors/
COMMENT=	Errors with stacktraces for go
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/go-errors/errors

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
