# $NetBSD$

DISTNAME=	kit-20201130
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	kit
GITHUB_TAG=	0ca22796c7622119f521a79bfd73a8b4d33a9ca4
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-kit/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	gokit.io
COMMENT=	Standard library for microservices
LICENSE=	mit

GO_SRCPATH=	github.com/go-kit/kit/
GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}

.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-jwt-go/buildlink3.mk"
.include "../../devel/go-logrus/buildlink3.mk"
.include "../../devel/go-sync/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../net/aws-sdk-go/buildlink3.mk"
.include "../../net/go-grpc/buildlink3.mk"
.include "../../wip/go-amqp/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
