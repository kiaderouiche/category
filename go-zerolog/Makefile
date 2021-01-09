# $NetBSD$

DISTNAME=       zerolog-20200806
PKGNAME=        go-${DISTNAME}
CATEGORIES=     devel
MASTER_SITES=   ${MASTER_SITE_GITHUB:=rs/}
GITHUB_PROJECT= zerolog
GITHUB_TAG=     72acd6cfe8bbbf5c52bfc805a3889c6941499c95

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/rs/zerolog/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	zerolog-${GITHUB_TAG}
GO_SRCPATH=	github.com/rs/zerolog

.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
