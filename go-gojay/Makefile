# $NetBSD$

DISTNAME=	go-gojay-1.2.13
GITHUB_PROJECT=	gojay
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=francoispqt/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/francoispqt/gojay/
COMMENT=	Fastest JSON encoder/decoder with powerful stream API for Golang
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/francoispqt/gojay

.include "../../devel/go-errors/buildlink3.mk"
.include "../../net*go-websocket/buildlink3.mk"
.include "../../wip/go-easyjson/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
