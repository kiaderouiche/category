# $NetBSD$

GITHUB_TAG=	v0.9.5
DISTNAME=	${GITHUB_TAG}
DIST_SUBDIR=	go-serf
PKGNAME=	${DIST_SUBDIR}-${GITHUB_TAG:S/v//}
CATEGORIES=	sysutils devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=hashicorp/}
GITHUB_PROJECT=	go-serf


MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/hashicorp/serf/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=	${WRKDIR}/${PKGNAME}
GO_DIST_BASE=	go-serf-${GITHUB_TAG:S/v//}
GO_SRCPATH=	github.com/hashicorp/serf/

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
