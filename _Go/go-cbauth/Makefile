# $NetBSD$

DISTNAME=	cbauth-20201026
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	cbauth
GITHUB_TAG=	0eaf917092a2a0063989e9a08b4a7ac3abf09e1e
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=couchbase/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/couchbase/cbauth
COMMENT=	4 ways golang services can interact with ns_server
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/couchbase/${GITHUB_PROJECT}

USE_LANGUAGES=	c c++
USE_CMAKE=	yes

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
