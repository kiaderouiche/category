# $NetBSD$

DISTNAME=	goa-3.2.6
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	goa
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=goadesign/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/goadesign/goa/
COMMENT=	Design-based APIs and microservices in Go
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/goadesign/goa

USE_TOOLS+=	gmake

.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../devel/go-yaml/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
