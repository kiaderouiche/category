# $NetBSD$

DISTNAME=	go-scany-0.2.7
GITHUB_PROJECT=	scany
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=georgysavva/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/georgysavva/scany/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/georgysavva/scany

.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-testify/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
