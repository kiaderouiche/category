# $NetBSD$

GITHUB_PROJECT=	kraft
GITHUB_TAG=	v0.95
DISTNAME=	v0.95
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=dragotin/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://volle-kraft-voraus.de/
COMMENT=	Manage invoices and documents for small companies
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/kraft-0.95
USE_CMAKE=		yes
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c++

.include "../../mk/bsd.pkg.mk"
