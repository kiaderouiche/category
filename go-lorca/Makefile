# $NetBSD$

DISTNAME=	go-lorca-0.1.9
MASTER_SITES=	${MASTER_SITE_GITHUB:=zserge/}
CATEGORIES=	x11
GITHUB_PROJECT=	lorca
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/zserge/lorca/
COMMENT=	Build cross-platform modern desktop apps in Go + HTML5
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/zserge/lorca/

WRKSRC=		${WRKDIR}/lorca-0.1.9

USE_LANGUAGES=	# none

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
