# $NetBSD$

DISTNAME=	lorca-0.1.9
PKGNAME=	go-${DISTNAME}
MASTER_SITES=	${MASTER_SITE_GITHUB:=zserge/}
CATEGORIES=	x11
GITHUB_PROJECT=	lorca
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/zserge/lorca/
COMMENT=	Build cross-platform modern desktop apps in Go + HTML5
LICENSE=	mit

#For Linux
#DEPENDS+=	zenity>=2.32.1:../../x11/zenity

GO_DIST_BASE=	${DISTNAME}
GO_SRCPATH=	github.com/zserge/lorca

#.include "../../net/go-websocket/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
