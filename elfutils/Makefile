# $NetBSD$

DISTNAME=	elfutils-0.181
CATEGORIES=	category
MASTER_SITES=	ftp://sourceware.org/pub/elfutils/0.181/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	ftp://sourceware.org/pub/elfutils/0.181/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

PKGCONFIG_OVERRIDE+=	config/libdebuginfod.pc.in
PKGCONFIG_OVERRIDE+=	config/libdw.pc.in
PKGCONFIG_OVERRIDE+=	config/libelf.pc.in

.include "../../mk/bsd.pkg.mk"
