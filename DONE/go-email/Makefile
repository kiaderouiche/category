# $NetBSD$

DISTNAME=	email-4.0.0
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	email
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_GITHUB:=jordan-wright/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/jordan-wright/email/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/jordan-wright/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
