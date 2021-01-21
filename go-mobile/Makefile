# $NetBSD$

DISTNAME=	mobile-20201217
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	mobile
PKGVERSION=	1
GITHUB_TAG=	e6ae53a27f4fd7cfa2943f2ae47b96cba8eb01c9
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=golang/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/golang/mobile 
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=     github.com/golang/mobile
GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}

.include "../../graphics/go-image/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
