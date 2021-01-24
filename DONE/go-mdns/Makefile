# $NetBSD$

DISTNAME=	mdns-20210118
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	mdns
GITHUB_TAG=	d366158455dbb89a394950aa68a17b3673ca0b53
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=pion/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pion/mdns/
COMMENT=	Pure Go implementation of Multicast DNS
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/pion/mdns

.include "../../net/go-net/buildlink3.mk"
.include "../../wip/go-logging/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
