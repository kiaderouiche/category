# $NetBSD$

DISTNAME=	konfig-0.8.3
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	konfig
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=lalamove/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/lalamove/konfig/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/lalamove/konfig

.include "../../www/go-toml-burntsushi/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
