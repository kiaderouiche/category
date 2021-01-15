# $NetBSD$

DISTNAME=	go-graphql-20200928
GITHUB_PROJECT=	graphql
GITHUB_TAG=	18c5c31
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=shurcooL/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/shurcooL/graphql/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}*
GO_SRCPATH=	github.com/shurcooL/graphql

.include "../../net/go-net/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
