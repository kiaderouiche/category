# $NetBSD$

DISTNAME=	clbanning-x2j-20191024
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	x2j
GITHUB_TAG=	825249438eec392bc87b980fb635b336e496a888
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=clbanning/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/clbanning/x2j/
COMMENT=	Unmarshal an anonymous XML doc to extract values
LICENSE=	2-clause-bsd

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/clbanning/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
