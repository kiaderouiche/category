# $NetBSD$

DISTNAME=	go-client_golang-1.9.0
GITHUB_PROJECT=	client_golang
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=prometheus/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/prometheus/client_golang/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/prometheus/client_golang

.include "../../wip/go-procfs/buildlink3.mk"
.include "../../security/go-xxhash/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
