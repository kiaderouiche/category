# $NetBSD$

PKGNAME=	${GITHUB_PROJECT}-1.0.10
DISTNAME=	${GITHUB_PROJECT}-${GITHUB_TAG}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=muquit/}
GITHUB_PROJECT=	mailsend-go
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/muquit/mailsend-go/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

EXTRACT_USING=	bsdtar

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/muquit/mailsend-go/

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
