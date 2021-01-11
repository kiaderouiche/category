# $NetBSD$

DISTNAME=	periph-20210101
GITHUB_PROJECT=	periph
GITHUB_TAG=	688e66ebfa5a498d3cf9b55f2233db0edd90754d
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=google/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/google/periph/
COMMENT=	Go Hardware Lean 
LICENSE=	apache-2.0

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/periph/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
