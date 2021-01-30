# $NetBSD$ 


DISTNAME=	elisa
PKGNAME=	elisa-20.12.1
GITHUB_PROJECT=	elisa
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/elisa/
COMMENT=	Audio player with QML and KDE Plasma integration
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/elisa-20.12.1

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
