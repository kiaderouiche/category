# $NetBSD$

DISTNAME=	go-paho-mqtt-1.3.1
GITHUB_PROJECT=	paho.mqtt.golang
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=eclipse/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/eclipse/paho.mqtt.golang/
COMMENT=	TODO: Short description of the package
LICENSE=	eclipse-license

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/eclipse/paho.mqtt.golang

.include "../../net/go-websocket/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
