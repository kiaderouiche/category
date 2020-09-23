# $NetBSD$

GITHUB_PROJECT=	redis
GITHUB_TAG=	v8.0.0-beta.10
DISTNAME=	v8.0.0-beta.10
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-redis/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/go-redis/redis/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/redis-8.0.0-beta.10

USE_LANGUAGES=	# none

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/go-redis/redis/

.include "../../databases/redis/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
