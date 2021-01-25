# $NetBSD$

DISTNAME=	n1ql-20160215
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go_n1ql
GITHUB_TAG=	6cf4e348b127e21f56e53eb8c3faaea56afdc588
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=kiaderouiche/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/kiaderouiche/go_n1ql/
COMMENT=	Driver for Go lang's database/sql package 
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/gopherdata//${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
