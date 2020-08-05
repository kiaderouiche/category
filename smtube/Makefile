# $NetBSD$

DISTNAME=	smtube-20.6.0
CATEGORIES=	multimedia
MASTER_SITES=	https://sourceforge.net/projects/smtube/files/SMTube/20.6.0/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://sourceforge.net/projects/smtube/files/SMTube/20.6.0/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		gmake
USE_LANGUAGES=		c++

SUBST_CLASSES+=         paths
SUBST_STAGE.paths=      pre-configure
SUBST_SED.paths+=       -e 's,/usr/local,${PREFIX},g'
SUBST_FILES.paths+=     Makefile
SUBST_MESSAGE.paths=    Fixing header search paths.

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
