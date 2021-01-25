# $NetBSD$

DISTNAME=	gophernotes-0.7.1
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	gophernotes
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=gopherdata/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/gopherdata/gophernotes/
COMMENT=	The Go kernel for Jupyter notebooks and nteract
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/gopherdata//${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
