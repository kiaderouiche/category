# $NetBSD$

DISTNAME=	samurai-2.1.1
CATEGORIES=	math
MASTER_SITES=	http://www.hepforge.org/archive/samurai/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://samurai.hepforge.org/
COMMENT=	Scattering AMplitudes from Unitarity-based Reduction Algorithm
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	fortran

PKGCONFIG_OVERRIDE+=	samurai.pc.in

.include "../../mk/bsd.pkg.mk"
