# $NetBSD$

GITHUB_PROJECT=	goji
GITHUB_TAG=	v1.0.1
DISTNAME=	v1.0.1
PKGNAME=	go-${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=zenazn/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/zenazn/goji/
COMMENT=	Minimalistic web framework that values composability and simplicity
#LICENSE=	# TODO: (see mk/license.mk)


WRKSRC=		${WRKDIR}/goji-1.0.1
USE_LANGUAGES=	# none

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/zenazn/goji/


.include "../../mk/bsd.pkg.mk"
