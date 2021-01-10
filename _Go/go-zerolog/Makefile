# $NetBSD$

DISTNAME=	zerolog-20201229
GITHUB_PROJECT=	zerolog
GITHUB_TAG=	0aba2e4ae597be7a72789c5bf2745daa664fcab3
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=rs/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/rs/zerolog/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	zerolog-${GITHUB_TAG}
GO_SRCPATH=	github.com/rs/zerolog

.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
