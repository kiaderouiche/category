# $NetBSD$

DISTNAME=	couchbase-20201216
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go-couchbase
GITHUB_TAG=	c04035124b17427663771bd1bdc98f38cad82993
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=couchbase/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://godoc.org/github.com/couchbase/go-couchbase
COMMENT=	Couchbase client in Go 
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/couchbase/${GITHUB_PROJECT}

.include "../../wip/go-randomdata/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
