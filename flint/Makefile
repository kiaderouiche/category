# $NetBSD$

DISTNAME=	flint-2.7.1
CATEGORIES=	category
MASTER_SITES=	http://www.flintlib.org/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.flintlib.org/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

HAS_CONFIGURE=	yes
USE_CMAKE=	yes
USE_LANGUAGES=	c c++

CONFIGURE_ARGS+=        --with-gmp=${PREFIX}
BUILDLINK_API_DEPENDS.gmp+=     gmp>=4.2.1
.include "../../devel/gmp/buildlink3.mk"
CONFIGURE_ARGS+=        --with-mpfr=${PREFIX}
BUILDLINK_API_DEPENDS.mpfr+=    mpfr>=2.0.3
.include "../../math/mpfr/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
