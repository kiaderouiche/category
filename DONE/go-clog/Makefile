# $NetBSD$

DISTNAME=	clog-20190523
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	clog
GITHUB_TAG=	b8e6d5d421bcc34f522e3a9a12fd6e09980995b1
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=couchbase/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/couchbase/clog
COMMENT=	TODO: Short description of the package
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/couchbase/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
