# $NetBSD$

GITHUB_PROJECT=	lorca
GITHUB_TAG=	v0.1.9
DISTNAME=	v0.1.9
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=zserge/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/zserge/lorca/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/zserge/lorca/

WRKSRC=		${WRKDIR}/lorca-0.1.9

USE_LANGUAGES=	# none

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
