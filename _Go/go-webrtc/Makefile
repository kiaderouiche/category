# $NetBSD$

DISTNAME=	webrtc-3.0.0
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	webrtc
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_GITHUB:=pion/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pion/webrtc/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/pion/webrtc

.include "../../net/go-net/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
