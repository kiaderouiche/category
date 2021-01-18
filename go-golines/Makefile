# $NetBSD$

DISTNAME=	go-golines-20200824
GITHUB_PROJECT=	golines
GITHUB_TAG=	7f30d3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=kiaderouiche/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/kiaderouiche/golines/
COMMENT=	Golang formatter that fixes long lines
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}*
GO_SRCPATH=	github.com/mitchellh/go-ps

.include "../../wip/go-ps/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
