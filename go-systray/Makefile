# $NetBSD$

DISTNAME=	go-systray-1.1.0
GITHUB_PROJECT=	systray
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=getlantern/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/getlantern/systray/
COMMENT=	Go library to place an icon and menu in the notification area
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/getlantern/systray

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
