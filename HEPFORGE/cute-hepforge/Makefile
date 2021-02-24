# $NetBSD$

DISTNAME=	CuTe-2.0.2
PKGNAME=	cute-hepforge-2.0.2
CATEGORIES=	math
MASTER_SITES=	http://www.hepforge.org/archive/cute/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://www.hepforge.org/archive/cute/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	CuTe.pc.in
PKGCONFIG_OVERRIDE+=	src/libCuTe/gsl-2.1/._gsl.pc.in
PKGCONFIG_OVERRIDE+=	src/libCuTe/gsl-2.1/gsl.pc.in

#-std=gnu++11
#configure: CXXFLAGS = -O2 -D_FORTIFY_SOURCE=2
#configure: LDFLAGS = -Wl,-z,relro -Wl,-z,now -Wl,-R/usr/pkg/lib

.include "../../math/gsl/buildlink3.mk"
.include "../../wip/lhapdf/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
