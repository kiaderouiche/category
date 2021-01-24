# $NetBSD$

DISTNAME=	ice-2.0.15
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	ice
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=pion/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pion/ice/
COMMENT=	Go implementation of ICE 
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/pion/ice



.include "../../net/go-net/buildlink3.mk"
.include "../../wip/go-logging/buildlink3.mk"
.include "../../wip/go-randutil/buildlink3.mk"
.include "../../wip/go-uuid/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
