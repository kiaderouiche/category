# $NetBSD$

DISTNAME=	forbidigo-20210103
GITHUB_PROJECT=	forbidigo
GITHUB_TAG=	b137aeaef3bfa161caff8458f2bf4941a30b7850
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=ashanbrown/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ashanbrown/forbidigo/
COMMENT=	Go linter for forbidding identifiers
LICENSE=	apache-2.0

GO_SRCPATH=	github.com/ashanbrown/forbidigo
GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}

.include "../../devel/go-mod/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
