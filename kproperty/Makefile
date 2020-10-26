# $NetBSD$

GITHUB_PROJECT=	kproperty
GITHUB_TAG=	v3.2.0
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://community.kde.org/KProperty
COMMENT=	Editing framework with an editor widget similar to Qt Designer 
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/kproperty-3.2.0

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../devel/kconfig/buildlink3.mk"
.include "../../x11/kguiaddons/buildlink3.mk"
.include "../../x11/kwidgetsaddons/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
