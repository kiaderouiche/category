# $NetBSD$

DISTNAME=	sospin-1.0.0
CATEGORIES=	math
MASTER_SITES=	https://sospin.hepforge.org/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://sospin.hepforge.org/
COMMENT=	C++ library for Yukawa decomposition in SO(2N) models
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_TOOLS+=	perl
USE_LANGUAGES=	c c++

DEPENDS+=	doxygen>=1.8.20:../../devel/doxygen
DEPENDS+=	graphviz>=2.44.1:../../graphics/graphviz
DEPENDS+=	tex-latex-bin-[0-9]*:../../print/tex-latex-bin
DEPENDS+=	tex-makeindex>=2.15:../../textproc/tex-makeindex


.include "../../mk/bsd.pkg.mk"
