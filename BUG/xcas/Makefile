# $NetBSD$

DISTNAME=	giac_stable
PKGNAME=	xcas
CATEGORIES=	math
MASTER_SITES=	https://www-fourier.ujf-grenoble.fr/~parisse/giac/
EXTRACT_SUFX=	.tgz

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://www-fourier.ujf-grenoble.fr/~parisse/giac/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/giac-1.6.0

GNU_CONFIGURE=		yes
USE_TOOLS+=	bison gmake
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

.include "../../mk/bsd.pkg.mk"
