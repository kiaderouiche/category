# $NetBSD$

DISTNAME=	goutils-20210119
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	goutils
GITHUB_TAG=	e33d3ffb5401c6e3c7577bf313e866ba12c2ca2a
PKGREVISION=	1
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=couchbase/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/couchbase/goutils/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/couchbase/${GITHUB_PROJECT}

.include "../../devel/go-errors/buildlink3.mk"
.include "../../security/go-crypto/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
