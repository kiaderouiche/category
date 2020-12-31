# $NetBSD$

DISTNAME=	go-forbidigo-1.0.0
GITHUB_PROJECT=	forbidigo
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=ashanbrown/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ashanbrown/forbidigo/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=	github.com/ashanbrown/forbidigo
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../devel/go-tools/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
