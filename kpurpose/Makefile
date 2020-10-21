# $NetBSD$

DISTNAME=	purpose-master
PKGNAME=	k${DISTNAME:S/-master//}-${VERS}
CATEGORIES=	misc
MASTER_SITES=	https://invent.kde.org/frameworks/purpose/-/archive/master/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://api.kde.org/frameworks/purpose/html/index.html
COMMENT=	Offers available actions for a specific purpose
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2 AND gnu-lgpl-v2.1

USE_CMAKE=	yes
VERS=		5.75.0
USE_TOOLS+=	msgmerge
USE_LANGUAGES=	c c++

.include "../../devel/kcoreaddons/buildlink3.mk"
.include "../../devel/kconfig/buildlink3.mk"
.include "../../devel/ki18n/buildlink3.mk"
.include "../../x11/kirigami2/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
