# $NetBSD$

DISTNAME=	hoppet-1.2.0
CATEGORIES=	math
MASTER_SITES=	https://hoppet.hepforge.org/downloads/
EXTRACT_SUFX=	.tgz

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://hoppet.hepforge.org/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_TOOLS+=	perl
HAS_CONFIGURE=	yes
USE_LANGUAGES=	c c++ fortran

REPLACE_PERL+=	configure

do-configure:
	cd ${WRKSRC} && ./configure --prefix=${DESTDIR}${PREFIX}
	
.include "../../mk/bsd.pkg.mk"
