# $NetBSD$

DISTNAME=	casbin-2.21.0
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	casbin
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=casbin/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/casbin/casbin/
COMMENT=	Authorization library that supports access control models
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/casbin/${GITHUB_PROJECT}

.include "../../wip/go-govaluate/buildlink3.mk"
.include "../../wip/go-mock/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
