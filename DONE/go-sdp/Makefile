# $NetBSD$

DISTNAME=	sdp-2.4.0
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	sdp
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	chat
MASTER_SITES=	${MASTER_SITE_GITHUB:=pion/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pion/sdp/
COMMENT=	Go implementation of the SDP
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/pion/sdp

.include "../../wip/go-randutil/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
