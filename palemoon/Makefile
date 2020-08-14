# $NetBSD$

GITHUB_PROJECT=	Pale-Moon
GITHUB_TAG=	28.12.0_Release
DISTNAME=	28.12.0_Release
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=MoonchildProductions/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/MoonchildProductions/Pale-Moon/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/Pale-Moon-28.12.0_Release

DEPENDS+=	yasm>=1.3.0:../../devel/yasm

USE_LANGUAGES=	c++
NO_CONFIGURE=	yes
USE_TOOLS+=	autoconf

PYTHON_VERSIONS_INCOMPATIBLE=   36 37 38

do-build:
	cd ${WRKSRC} && ./mach build

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
