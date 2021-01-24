# $NetBSD$

GITHUB_PROJECT=	ssdb
GITHUB_TAG=	1.9.9
DISTNAME=	1.9.9
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=ideawu/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://ideawu.github.io/ssdb-docs/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/ssdb-1.9.9

USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	deps/jemalloc-4.1.0/jemalloc.pc.in

.include "../../mk/bsd.pkg.mk"
