# $NetBSD$

DISTNAME=	go-lorca-0.1.9
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=zserge/}
GITHUB_PROJECT=	lorca
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/zserge/lorca/
COMMENT=	Build cross-platform modern desktop apps in Go + HTML5
LICENSE=	mit

GO_SRCPATH=	github.com/zserge/lorca
#GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_DIST_BASE=	${DISTNAME:S,go-,,}

WRKSRC=		${WRKDIR}/lorca-0.1.9

USE_LANGUAGES=	# none

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
