# $NetBSD$

DISTNAME=	go-redis-8.4.4
GITHUB_PROJECT=	redis
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-redis/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/go-redis/redis/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/go-redis/redis/

.include "../../databases/redis/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
