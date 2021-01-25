# $NetBSD$

DISTNAME=	zookeeper-20201211
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go-zookeeper
GITHUB_TAG=	7117e9ea24146db92d453f4dbf1fd9ba1e262989
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=samuel/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/samuel/go-zookeeper
COMMENT=	Native Go Zookeeper Client Library
LICENSE=	2-clause-bsd

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/samuel/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
