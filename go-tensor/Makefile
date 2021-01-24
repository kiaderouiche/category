# $NetBSD$

DISTNAME=	tensor-0.9.19
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	tensor
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=gorgonia/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/gorgonia/tensor/
COMMENT=	TODO: Short description of the package
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/gorgonia/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
