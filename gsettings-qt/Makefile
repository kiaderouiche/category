# $NetBSD$

DISTNAME=	gsettings-qt_0.1+17.10.20170824.orig
CATEGORIES=	category
MASTER_SITES=	http://deb.debian.org/debian/pool/main/g/gsettings-qt/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://code.launchpad.net/gsettings-qt
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-lgpl-v3

WRKSRC=		${WRKDIR}/gsettings-qt-0.1+17.10.20170824

USE_TOOLS+=		pkg-config
USE_LANGUAGES=	c c++

do-configure:
 	cd ${WRKSRC} && ${QTDIR}/bin/qmake gsettings-qt.pro


.include "../../devel/glib2/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
