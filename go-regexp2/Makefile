# $NetBSD$

DISTNAME=	go-regexp2-1.4.0
GITHUB_PROJECT=	regexp2
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=dlclark/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/dlclark/regexp2/
COMMENT=	Regex engine in pure Go based on the .NET engine
LICENSE=	mit

GO_SRCPATH=	github.com/dlclark/regexp2
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
