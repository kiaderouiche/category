# $NetBSD$

GITHUB_PROJECT=	kpmcore
GITHUB_TAG=	v4.2.0
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/kpmcore/
COMMENT=	KDE Partition Manager core library
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/kpmcore-4.2.0

USE_TOOLS+=	pkg-config msgmerge

#DEPENDS+=	util-linux>=2.34:../../wip/util-linux

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../devel/ki18n/buildlink3.mk"
.include "../../devel/libuuid/buildlink3.mk"
.include "../../security/kauth/buildlink3.mk"
.include "../../security/polkit-qt5/buildlink3.mk"
.include "../../x11/kwidgetsaddons/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
