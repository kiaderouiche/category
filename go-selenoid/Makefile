# $NetBSD$

DISTNAME=	go-selenoid-1.10.0
GITHUB_PROJECT=	selenoid
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=aerokube/}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/aerokube/selenoid/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=	github.com/aerokube/selenoid/
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../net/go-net/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
