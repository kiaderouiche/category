# $NetBSD$

DISTNAME=	go-circonus-gometrics-3.3.0
GITHUB_PROJECT=	circonus-gometrics
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=circonus-labs/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/circonus-labs/circonus-gometrics/
COMMENT=	Go implementation of metrics reporting for Circonus 
LICENSE=	2-clause-bsd

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/circonus-labs/circonus-gometrics

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
