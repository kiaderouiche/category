# $NetBSD$

GITHUB_PROJECT=	zxing-cpp
GITHUB_TAG=	v1.1.1
DISTNAME=	v1.1.1
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=nu-book/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
Homepage=	https://github.com/nu-book/zxing-cpp/
COMMENT=	C++ port of ZXing
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/zxing-cpp-1.1.1

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c++

PKGCONFIG_OVERRIDE+=	zxing.pc.in

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
