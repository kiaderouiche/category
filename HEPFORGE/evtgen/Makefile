# $NetBSD$

DISTNAME=	EvtGen-02.00.00
PKGNAME=	${DISTNAME:tl}
CATEGORIES=	math
MASTER_SITES=	https://evtgen.hepforge.org/downloads/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://evtgen.hepforge.org
COMMENT=	Monte Carlo event generator that simulates the decays of heavy flavour particles
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/EvtGen/R02-00-00

CMAKE_USE=	yes
USE_LANGUAGES=	c c++

REPLACE_PYTHON+=	convertDecayFile.py

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
