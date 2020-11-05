# $NetBSD$

GITHUB_PROJECT=	massif-visualizer
GITHUB_TAG=	v0.7.0
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/massif-visualizer/
COMMENT=	Visualizer for Valgrind Massif memory-usage tracking tool
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/massif-visualizer-0.7.0

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

DEPENDS+=	kqtquickcharts>=20.04.1:../../graphics/kqtquickcharts

.include "../../archivers/karchive/buildlink3.mk"
.include "../../devel/kcoreaddons/buildlink3.mk"
.include "../../devel/kconfig/buildlink3.mk"
.include "../../devel/ki18n/buildlink3.mk"
.include "../../devel/kio/buildlink3.mk"
.include "../../devel/kparts/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
