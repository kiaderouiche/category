# $NetBSD$

DISTNAME=	ws-20201209
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	ws
GITHUB_TAG=	e5bc048aff8312364cf900036c0381f791a9888a
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=gobwas/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/gobwas/ws/
COMMENT=	Tiny WebSocket library for Go
LICENSE=	mit

GO_SRCPATH=	github.com/gobwas/ws
GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}

.include "../../wip/go-httphead/buildlink3.mk"
.include "../../wip/go-pool/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
