# $NetBSD$

DISTNAME=	wails-20210105
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	wails
GITHUB_TAG=	4a6e9d059cc5d2cb9fff24218bfcfe830280a476
CATEGORIES=	wm www
MASTER_SITES=	${MASTER_SITE_GITHUB:=wailsapp/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/wailsapp/wails/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/wailsapp/wails

.include "../../devel/go-yaml/buildlink3.mk"
.include "../../graphics/go-image/buildlink3.mk"
.include "../../net/go-websocket/buildlink3.mk"
.include "../../textproc/go-text/buildlink3.mk"
.include "../../wip/go-color/buildlink3.mk"
.include "../../wip/go-semver/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
