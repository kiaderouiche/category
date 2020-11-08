# $NetBSD$

GITHUB_PROJECT=	sh
GITHUB_TAG=	v3.2.0
DISTNAME=	v3.2.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	shells
MASTER_SITES=	${MASTER_SITE_GITHUB:=mvdan/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mvdan/sh/
COMMENT=	Shell parser, formatter, and interpreter with bash support
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/sh-3.2.0

USE_LANGUAGES=	# none

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
