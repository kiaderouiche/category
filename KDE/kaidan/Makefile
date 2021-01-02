# $NetBSD$

GITHUB_PROJECT=	kaidan
GITHUB_TAG=	v0.6.0
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	chat
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/kaidan/
COMMENT=	Jabber/XMPP client for every device and platform
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/kaidan-0.6.0

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../x11/kirigami2/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
