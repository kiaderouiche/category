# $NetBSD$

DISTNAME=	go-rpcx-6.0.1
GITHUB_PROJECT=	rpcx
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=smallnest/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://rpcx.io/
COMMENT=	Faster multi-language bidirectional microservices framework in Go
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/smallnest/rpcx

.include "../../devel/go-ratelimit/buildlink3.mk"
.include "../../devel/go-thrift/buildlink3.mk"
.include "../../wip/go-color/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
