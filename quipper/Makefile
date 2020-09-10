# $NetBSD$

DISTNAME=	quipper-0.9.0.0
CATEGORIES=	lang
MASTER_SITES=	https://www.mathstat.dal.ca/~selinger/quipper/downloads/
EXTRACT_SUFX=	.tgz

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://www.mathstat.dal.ca/~selinger/quipper/
COMMENT=	Embedded, scalable functional programming language for quantum computing
#LICENSE=	# TODO: (see mk/license.mk)

USE_LANGUAGES=	# none

DEPENDS+=	xpdf>=4.02:../../print/xpdf4

.include "../../lang/ghc7/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
