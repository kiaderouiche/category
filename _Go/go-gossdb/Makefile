# $NetBSD$

DISTNAME=	gossdb-20180723
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	gossdb
GITHUB_TAG=	88f6b59b84ece096894b780e7c17b54e1301cd5b
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=ssdb/}

MAINTAINER=	SSDB Golang client
HOMEPAGE=	https://github.com/ssdb/gossdb/
COMMENT=	TODO: Short description of the package
LICENSE=	2-clause-bsd

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/ssdb/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
