# $NetBSD$

DISTNAME=	smplayer-skins-15.2.0
CATEGORIES=	multimedia
MASTER_SITES=	https://netix.dl.sourceforge.net/project/smplayer/SMPlayer-skins/15.2.0/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://netix.dl.sourceforge.net/project/smplayer/SMPlayer-skins/15.2.0/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

#BUILD_DEPENDS+=	lcc>=4.1:../../devel/lcc

USE_LANGUAGES=	# none

SUBST_CLASSES+=         paths
SUBST_STAGE.paths=      pre-configure
SUBST_SED.paths+=       -e 's,/usr/local,${PREFIX},g'
SUBST_FILES.paths+=     Makefile
SUBST_MESSAGE.paths=    Fixing header search paths.

.include "../../mk/bsd.pkg.mk"
