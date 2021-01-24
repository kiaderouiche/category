# $NetBSD$

DISTNAME=	genproto-20210122
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go-genproto
GITHUB_TAG=	8081c04a3579e5b37c24d9ab3e3069d823dc24b2
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GITHUB:=googleapis/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/googleapis/go-genproto
COMMENT=	TODO: Short description of the package
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/googleapis/go-genproto

.include "../../devel/go-protobuf/buildlink3.mk"
.include "../../net/go-grpc/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
