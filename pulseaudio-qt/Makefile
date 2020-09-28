# $NetBSD$

GITHUB_PROJECT=	pulseaudio-qt
GITHUB_TAG=	v1.2.0
DISTNAME=	v1.2.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/pulseaudio-qt/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/pulseaudio-qt-1.2.0

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../mk/bsd.pkg.mk"
