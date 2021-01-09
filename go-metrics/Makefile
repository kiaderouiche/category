# $NetBSD$

PKGNAME=	${GITHUB_PROJECT}-3.0.5
DISTNAME=	${GITHUB_PROJECT}-${GITHUB_TAG}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=armon/}
GITHUB_PROJECT=	go-metrics
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/armon/go-metrics/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/armon/go-metrics/


.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
