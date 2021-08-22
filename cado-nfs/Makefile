# $NetBSD$

DISTNAME=	cado-nfs-master
CATEGORIES=	category
MASTER_SITES=	https://gitlab.inria.fr/cado-nfs/cado-nfs/-/archive/master/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://gitlab.inria.fr/cado-nfs/cado-nfs/-/archive/master/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	gf2x/gf2x.pc.in

.include "../../mk/bsd.pkg.mk"
