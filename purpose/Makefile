# $NetBSD$

GITHUB_PROJECT=	purpose
GITHUB_TAG=	v5.74.0
DISTNAME=	v5.74.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/purpose/
COMMENT=	Framework for providing abstractions to get the developer
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/purpose-5.74.0

USE_CMAKE=		yes
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
