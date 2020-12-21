# $NetBSD$

GITHUB_PROJECT=	osquery
GITHUB_TAG=	4.5.1
DISTNAME=	4.5.1
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=osquery/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://osquery.io/
COMMENT=	SQL powered OS instrumentation, monitoring, and analytics
LICENSE=	apache-2.0 OR gnu-gpl-v2

WRKSRC=		${WRKDIR}/osquery-4.5.1

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../mk/bsd.pkg.mk"
