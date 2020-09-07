# $NetBSD$

GITHUB_PROJECT=	gowut
GITHUB_TAG=	dd528033b08560ee2130dcf81050f2fba234ca0b
DISTNAME=	v1.4.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	www wm
MASTER_SITES=	${MASTER_SITE_GITHUB:=icza/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/icza/gowut/
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/gowut-1.4.0/gwu

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/icza/gowut

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
