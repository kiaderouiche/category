# $NetBSD$

DISTNAME=	go-redis-8.4.4
GITHUB_PROJECT=	go-redis
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-redis/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://redis.uptrace.dev/
COMMENT=	Type-safe Redis client for Golang
LICENSE=	2-clause-bsd

GO_DIST_BASE=	redis--${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/go-redis/redis

#DEPENDS+=	redis>=6.0.9:../../databases/redis

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
