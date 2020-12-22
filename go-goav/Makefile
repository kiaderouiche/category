# $NetBSD$

DISTNAME=	go-goav-0.1.0
GITHUB_PROJECT=	goav
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=giorgisio/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/giorgisio/goav/
COMMENT=	Golang bindings for FFmpeg
LICENSE=	mit

EXTRACT_USING=	bsdtar

GO_SRCPATH=	github.com/giorgisio/goav/
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
