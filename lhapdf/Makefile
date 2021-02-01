# $NetBSD$

DISTNAME=	LHAPDF-6.3.0
PKGNAME=	${DISTNAME:tl}
CATEGORIES=	math
MASTER_SITES=	https://lhapdf.hepforge.org/downloads/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://lhapdf.hepforge.org
COMMENT=	Les Houches Accord PDF library and interface
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	lhapdf.pc.in

CONFIGURE_ARGS+=	--enable-mpi
CONFIGURE_ARGS+=	--disable-octave

.include "options.mk"

.include "../../mk/mpi.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
