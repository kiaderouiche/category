# $NetBSD$

DISTNAME=	mixmax_release_200final
CATEGORIES=	math
MASTER_SITES=	https://mixmax.hepforge.org/downloads/
EXTRACT_SUFX=	.zip

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://mixmax.hepforge.org/
COMMENT=	MIXMAX is the matrix-recursive random number generator
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake

.include "../../math/gsl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
