# $NetBSD$

DISTNAME=	kdevelop-pg-qt-0.9.5
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_KDE:=kdevelop-pg-qt/0.9.5/src/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://download.kde.org/stable/kdevelop-pg-qt/0.9.5/src/ # TODO: check
COMMENT=	Parser-generator from KDevplatform
LICENSE=	gnu-lgpl-v2

USE_CMAKE=	yes
USE_TOOLS+=    bison flex perl
USE_LANGUAGES=	c c++ fortran

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
