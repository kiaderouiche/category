# $NetBSD$

DISTNAME=	go-objx-0.3.0
GITHUB_PROJECT=	objx
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=stretchr/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/stretchr/objx/
COMMENT=	Go package for dealing with maps, slices, JSON and other data
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/stretchr/objx

post-install:
	${RM} -rf ${DESTDIR}${PREFIX}/gopkg/pkg/${GO_PLATFORM}/${GO_SRCPATH}/vendor
	
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
