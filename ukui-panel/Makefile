# $NetBSD$

GITHUB_PROJECT=	ukui-panel
DISTNAME=	ukui-panel_3.0.0.orig
CATEGORIES=	wm
MASTER_SITES=	${MASTER_SITE_GITHUB:=ukui/}
GITHUB_RELEASE=	v3.0.0

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ukui/ukui-panel/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/ukui-panel

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

#-std=c++11

.include "../../devel/libdbusmenu-qt5/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
