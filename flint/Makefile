# $NetBSD$

DISTNAME=	flint-2.6.3
CATEGORIES=	math
MASTER_SITES=	http://www.flintlib.org/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://www.flintlib.org/
COMMENT=	Fast Library for Number Theory
LICENSE=	gnu-lgpl-v2.1

HAS_CONFIGURE=	yes
USE_CMAKE=	yes
USE_LANGUAGES=	c c++

BUILDLINK_API_DEPENDS.gmp+=	gmp>=6.0
.include "../../devel/gmp/buildlink3.mk"
BUILDLINK_API_DEPENDS.gmp+=	mpfr>=6.0
.include "../../math/mpfr/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
