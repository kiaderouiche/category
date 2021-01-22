# $NetBSD$

DISTNAME=	go-handers-1.5.1
GITHUB_PROJECT=	handlers
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=gorilla/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/gorilla/handlers/
COMMENT=	Middleware for Go HTTP services/web applications
LICENSE=	2-clause-bsd

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/gorilla/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
