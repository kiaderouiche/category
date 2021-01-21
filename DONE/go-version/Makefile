# $NetBSD$

DISTNAME=	go-version-1.2.1
GITHUB_PROJECT=	go-version
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=hashicorp/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/hashicorp/go-version/
COMMENT=	Library for parsing and verifying versions and version
LICENSE=	mpl-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/hashicorp/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
