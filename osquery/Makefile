# $NetBSD$

GITHUB_PROJECT=	osquery
GITHUB_TAG=	4.5.1
DISTNAME=	4.5.1
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=osquery/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/osquery/osquery/
COMMENT=	SQL powered OS instrumentation, monitoring, and analytics
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/osquery-4.5.1
USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../mk/bsd.pkg.mk"
