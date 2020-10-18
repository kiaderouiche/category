# $NetBSD$

DISTNAME=	mauikit-v1.1.1
PKGNAME=	${DISTNAME:S,-v,-,}
CATEGORIES=	multimedia
MASTER_SITES=	https://invent.kde.org/maui/mauikit/-/archive/v1.1.1/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://mauikit.org/
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v3

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
