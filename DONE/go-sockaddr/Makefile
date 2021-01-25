# $NetBSD$

DISTNAME=	go-sockaddr-1.0.2
GITHUB_PROJECT=	go-sockaddr
PKGREVISION=	1
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=hashicorp/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/hashicorp/go-sockaddr/
COMMENT=	IP Address/UNIX Socket convenience functions for Go
LICENSE=	mpl-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/hashicorp/${GITHUB_PROJECT}

.include "../../wip/go-errwrap/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
