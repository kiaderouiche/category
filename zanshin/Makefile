# $NetBSD$

DISTNAME=	zanshin-${KAPPSVER}
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_KDE:=zanshin/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://zanshin.kde.org/
COMMENT=	User interface lets you quickly see an overview of your life and tasks
LICENSE=	gnu-gpl-v3 AND gnu-gpl-v2

USE_CMAKE=		yes
USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		msgmerge
USE_LANGUAGES=		c c++


.include "../../devel/boost-headers/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
