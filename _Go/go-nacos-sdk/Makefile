# $NetBSD$

DISTNAME=	go-nacos-sdk-1.0.3
GITHUB_PROJECT=	nacos-sdk-go
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=nacos-group/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/nacos-group/nacos-sdk-go/
COMMENT=	Nacos client in Golang
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/nacos-group/nacos-sdk-go

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
