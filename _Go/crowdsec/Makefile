# $NetBSD$

DISTNAME=	crowdsec-1.0.2
GITHUB_PROJECT=	crowdsec
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=crowdsecurity/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://crowdsec.net/
COMMENT=	Lightweight agent to detect and respond to bad behaviours
LICENSE=	mit

USE_TOOLS+=	bash gmake

GO_SRCPATH=	github.com/crowdsecurity/crowdsec
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../mk/bsd.pkg.mk"
