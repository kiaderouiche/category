# $NetBSD$

GITHUB_PROJECT=	webview
GITHUB_TAG=	0.1.1
DISTNAME=	0.1.1
PKGNAME=	go-${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=webview/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/webview/webview/
COMMENT=	Tiny cross-platform webview library for C/C++/Golang to build modern cross-platform GUIs
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/webview-0.1.1

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	https://github.com/webview/webview/

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
