# $NetBSD$

DISTNAME=	mediadevices-0.1.14
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	mediadevices
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_GITHUB:=pion/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pion/mediadevices/
COMMENT=	TODO: Short description of the package
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/pion/mediadevices

.include "../../wip/go-uuid/buildlink3.mk"
.include "../../graphics/go-image/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
