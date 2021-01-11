# $NetBSD$

DISTNAME=	samurai-2.1.1
CATEGORIES=	math
MASTER_SITES=	http://www.hepforge.org/archive/samurai/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://samurai.hepforge.org/
COMMENT=	Scattering AMplitudes from Unitarity-based Reduction Algorithm
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	gmake perl pkg-config
USE_LANGUAGES=	c fortran

PKGCONFIG_OVERRIDE+=	samurai.pc.in

#CONFIGURE_ARGS+=	--without-precision
CONFIGURE_ARGS+=	--with-avh_olo-precision
CONFIGURE_ARGS+=	--without-avh_olo
CONFIGURE_ARGS+=	--without-qcdloop
CONFIGURE_ARGS+=	--without-golem

.include "../../mk/bsd.pkg.mk"
