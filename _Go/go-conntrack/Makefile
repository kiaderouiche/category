# $NetBSD$

DISTNAME=	go-conntrack-20190716
GITHUB_PROJECT=	go-conntrack
GITHUB_TAG=	2f06839
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=mwitkow/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://prometheus.io/
COMMENT=	Go middleware for net.Conn tracking
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}*
GO_SRCPATH=     github.com/prometheus/common

.include "../../net/go-net/buildlink3.mk"
.include "../../wip/go-jpillora-backoff/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
