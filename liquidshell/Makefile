# $NetBSD$

DISTNAME=	liquidshell-1.7.2
GITHUB_PROJECT=	liquidshell
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/liquidshell/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../devel/kcmutils/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
