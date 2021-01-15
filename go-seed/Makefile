# $NetBSD$

DISTNAME=	go-seed-0.3.1
GITHUB_PROJECT=	seed
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=qlova/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/qlova/seed/
COMMENT=	Cross-platform Go framework for building apps
LICENSE=	gnu-lgpl-v3

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/qlova/${GITHUB_PROJECT}

.include "../../www/go-minify:/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
