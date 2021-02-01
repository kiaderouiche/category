# $NetBSD$

DISTNAME=	LHAPDF-6.3.0
PKGNAME=	${DISTNAME:tl}
CATEGORIES=	math
MASTER_SITES=	https://lhapdf.hepforge.org/downloads/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://lhapdf.hepforge.org/downloads/
COMMENT=	Les Houches Accord PDF library and interface
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c++

PKGCONFIG_OVERRIDE+=	lhapdf.pc.in

.include "../../mk/bsd.pkg.mk"
