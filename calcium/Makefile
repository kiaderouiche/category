# $NetBSD$

GITHUB_PROJECT=	calcium
GITHUB_TAG=	0.2.0
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=fredrik-johansson/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/fredrik-johansson/calcium/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/calcium-0.2.0

USE_TOOLS+=	gmake
HAS_CONFIGURE=	yes

CONFIGURE_ARGS+=	--prefix=/usr/pkg
CONFIGURE_ARGS+=        --without-ntl                                         
CONFIGURE_ARGS+=        --without-blas                                        
                                                                               
CONFIGURE_ARGS+=        --with-gmp=${PREFIX}                                  
BUILDLINK_API_DEPENDS.gmp+=     gmp>=6.0                                      
.include "../../devel/gmp/buildlink3.mk"                                      
CONFIGURE_ARGS+=        --with-mpfr=${PREFIX}                                 
BUILDLINK_API_DEPENDS.mpfr+=    mpfr>=2.0.3                                   
.include "../../math/mpfr/buildlink3.mk"   
CONFIGURE_ARGS+=	--with-flint=${PREFIX}
BUILDLINK_API_DEPENDS.flint+=	flint>=2.6.3
.include "../../wip/flint/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
