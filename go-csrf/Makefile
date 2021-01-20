# $NetBSD$

DISTNAME=	go-csrf-1.7.0
PKGREVISION=	1
GITHUB_PROJECT=	csrf
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=gorilla/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/gorilla/csrf/
COMMENT=	Cross Site Request Forgery prevention middleware
LICENSE=	2-clause-bsd

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/gorilla/csrf/

.include "../../devel/go-errors/buildlink3.mk"
.include "../../wip/go-gorilla-securecookie/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
