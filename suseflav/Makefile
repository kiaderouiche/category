# $NetBSD$

DISTNAME=	SuSeFLAV-1.2.0
PKGNAME=	${DISTNAME:tl}
CATEGORIES=	math
MASTER_SITES=	https://suseflav.hepforge.org/downloads/
EXTRACT_SUFX=	.tgz

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://suseflav.hepforge.org/
COMMENT=	Essential to completely understand Supersymmetry
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/SuSeFLAV-1.2

USE_TOOLS+=	gmake
USE_LANGUAGES=	fortran

do-build:
	cd ${WRKSRC} && ${GMAKE}

.include "../../mk/bsd.pkg.mk"
