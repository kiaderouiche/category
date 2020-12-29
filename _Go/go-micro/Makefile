# $NetBSD$

GITHUB_PROJECT=	go-micro
GITHUB_TAG=	v2.9.1
DISTNAME=	v2.9.1
PKGNAME=	go-${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	www devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=micro/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/micro/go-micro/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/go-micro-2.9.1

USE_LANGUAGES=	# none

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/micro/go-micro

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
