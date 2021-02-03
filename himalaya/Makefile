# $NetBSD$

GITHUB_PROJECT=	Himalaya
GITHUB_TAG=	4.0.0
DISTNAME=	4.0.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=Himalaya-Library/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/Himalaya-Library/Himalaya/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/Himalaya-4.0.0
USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c++ fortran

PKGCONFIG_OVERRIDE+=	cmake/himalaya.pc.in

.include "../../mk/bsd.pkg.mk"
