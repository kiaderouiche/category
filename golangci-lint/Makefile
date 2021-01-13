# $NetBSD$

DISTNAME=	golangci-lint-1.34.1
GITHUB_PROJECT=	golangci-lint
GITHUB_TAG=	v1.34.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=golangci/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/golangci/golangci-lint/
COMMENT=	Fast linters Runner for Go
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=	github.com/golangci/golangci-lint
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
