# $NetBSD$

DISTNAME=	libform-4.2.1	
GITHUB_PROJECT=	form
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=vermaseren/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://www.nikhef.nl/~form
COMMENT=	The FORM project for symbolic manipulation of very big expressions
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/form-4.2.1

GNU_CONFIGURE=	yes
USE_TOOLS+=	automake autoconf autoreconf gmake
USE_LANGUAGES=	c c++

pre-configure:
	cd ${WRKSRC} && autoreconf -if

.include "../../devel/gmp/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
