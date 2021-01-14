# $NetBSD$

DISTNAME=	go-githubv4-20201206
GITHUB_PROJECT=	githubv4
GITHUB_TAG=	234843c633fadff9694210ce7ab97948c9148a14
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=shurcooL/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/shurcooL/githubv4
COMMENT=	Githubv4 is a client library for accessing GitHub GraphQL API v4 
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/shurcooL/githubv4

.include "../../security/go-crypto/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
