# $NetBSD$

GITHUB_PROJECT=	heaptrack
GITHUB_TAG=	v1.2.0
DISTNAME=	v1.2.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/heaptrack/
COMMENT=	Heap memory profiler
LICENSE=	gnu-lgpl-v2.1

WRKSRC=		${WRKDIR}/heaptrack-1.2.0

USE_CMAKE=	yes
USE_TOOLS=      msgmerge
USE_LANGUAGES=	c c++

DEPENDS+=	kqtquickcharts>=20.04.1:../../graphics/kqtquickcharts

.include "../../archivers/zstd/buildlink3.mk"
BUILDLINK_API_DEPENDS.boost-headers+=   boost-headers-1.73.*
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../lang/libunwind/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
