# $NetBSD$

GITHUB_PROJECT=	systray
GITHUB_TAG=	v1.0.4
DISTNAME=	v1.0.4
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	x11 sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=getlantern/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/getlantern/systray/
COMMENT=	Go library to place an icon and menu in the notification area 
LICENSE=	apache-2.0

WRKSRC=	${WRKDIR}/systray-1.0.4

USE_TOOLS+=	gmake

.include "../../devel/libappindicator3/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
