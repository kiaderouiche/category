# $NetBSD$

DISTNAME=	golangci-lint-1.35.2
GITHUB_PROJECT=	golangci-lint
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=golangci/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/golangci/golangci-lint/
COMMENT=	Fast linters Runner for Go 
LICENSE=	gnu-gpl-v3

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/golangci/golangci-lint

.include "../../devel/go-testify/buildlink3.mk"
.include "../../wip/go-color/buildlink3.mk"
.include "../../wip/go-color/buildlink3.mk"
.include "../../wip/go-color/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
