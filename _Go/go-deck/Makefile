# $NetBSD$

DISTNAME=	deck-20210118
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	deck
GITHUB_TAG=	74fd83332834404672799e940fe7cf2ac1c94b3c
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GITHUB:=ajstarks/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ajstarks/deck/
COMMENT=	Library for clients to make scalable presentations
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/ajstarks/deck

.include "../../graphics/go-gift/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
