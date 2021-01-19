# $NetBSD$

DISTNAME=	go-panicparse-1.6.0
GITHUB_PROJECT=	panicparse
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=maruel/}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/maruel/panicparse/
COMMENT=	Crash your app in style
LICENSE=	apache-2.0

GO_SRCPATH=	github.com/maruel/panicparse
GO_DIST_BASE=	panicparse-${GITHUB_TAG}

.include "../../mattn/go-colorable/buildlink3.mk"
.include "../../mattn/go-isatty/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
