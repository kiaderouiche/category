# $NetBSD$

DISTNAME=	interceptor-0.0.9
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	interceptor
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=pion/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pion/interceptor/
COMMENT=	Pluggable RTP/RTCP processors for building real time communication
LICENSE=	mit


GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/pion/interceptor

.include "../../wip/go-logging/buildlink3.mk"
.include "../../wip/go-rtp/buildlink3.mk"
.include "../../wip/go-rtcp/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
