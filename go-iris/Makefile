# $NetBSD$

DISTNAME=	iris-20200913
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	iris
PKGREVISION=	1
GITHUB_TAG=	a917ef68fc401f5ca8f421fba50db4e129966b52
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=kataras/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/kataras/iris/
COMMENT=	TODO: Short description of the package
LICENSE=	2-clause-bsd

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/kataras/${GITHUB_PROJECT}

.include "../../devel/go-amber/buildlink3.mk"
.include "../../devel/go-blackfriday/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
