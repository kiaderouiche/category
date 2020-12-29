# $NetBSD$

DISTNAME=	go-nui-0.3.0
GITHUB_PROJECT=	nui
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=lalamove/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/lalamove/nui/
COMMENT=	TODO: Short description of the package
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/lalamove/nui

.include "../../devel/go-cast/buildlink3.mk"
.include "../../wip/go-opentracing/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
