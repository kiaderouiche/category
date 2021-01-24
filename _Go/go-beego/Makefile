# $NetBSD$

DISTNAME=	beego-20210124
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	beego
GITHUB_TAG=	d7a918f2c314926d99ef9bcb2694260abd0f9dca
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=beego/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/beego/beego/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=	github.com/beego/beego
GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}


.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../net/go-grpc/buildlink3.mk"
.include "../../wip/go-ansicolor/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
