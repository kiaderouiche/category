# $NetBSD$

DISTNAME=	go-common-0.15.0
GITHUB_PROJECT=	common
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=prometheus/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/prometheus/common/
COMMENT=	Across Prometheus components and libraries
LICENSE=	apache-2.0

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/prometheus/common

USE_TOOLS+=	gmake

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"