# $NetBSD$

GITHUB_TAG=	v1.33.0
DISTNAME=	${GITHUB_TAG}
DIST_SUBDIR=	${GITHUB_PROJECT}
PKGNAME=	${GITHUB_PROJECT}-${GITHUB_TAG:S/v//}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=golangci/}
GITHUB_PROJECT=	golangci-lint

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/golangci/golangci-lint/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/golangci-lint-1.33.0
GO_DIST_BASE=	golangci-lint-${GITHUB_TAG:S/v//}
GO_SRCPATH=	github.com/golangci/golangci-lint/

.include "../../devel/go-testify/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
