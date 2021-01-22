# $NetBSD$

DISTNAME=	go-snappy-0.0.2
GITHUB_PROJECT=	snappy
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_GITHUB:=golang/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/golang/snappy/
COMMENT=	The Snappy compression format in the Go
LICENSE=	2-clause-bsd

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/golang/snappy

USE_LANGUAGES=	c++

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
