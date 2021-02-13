# $NetBSD$

DISTNAME=	massif-visualizer-20210121
GITHUB_PROJECT=	massif-visualizer
GITHUB_TAG=	a7389a0447a2c65698809b9323f9fcace6b956cf
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/KDE/massif-visualizer/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/massif-visualizer-a7389a0447a2c65698809b9323f9fcace6b956cf
USE_CMAKE=	yes
USE_LANGUAGES=	c c++

DEPENDS+=	kqtquickcharts
.include "../../graphics/kqtquickcharts/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
