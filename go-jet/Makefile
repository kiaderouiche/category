# $NetBSD$

GITHUB_TAG=	v6.0.1
DISTNAME=	${GITHUB_TAG}
DIST_SUBDIR=	${GITHUB_PROJECT}
PKGNAME=	go-${GITHUB_PROJECT}-${GITHUB_TAG:S/v//}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=CloudyKit/}
GITHUB_PROJECT=	jet

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/CloudyKit/jet/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/jet-6.0.1
GO_DIST_BASE=	jet-${GITHUB_TAG:S/v//}
GO_SRCPATH=	github.com/CloudyKit/jet/


.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
