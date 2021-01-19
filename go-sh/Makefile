# $NetBSD$

DISTNAME=	go-sh-3.2.1
GITHUB_PROJECT=	sh
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	shells
MASTER_SITES=	${MASTER_SITE_GITHUB:=mvdan/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mvdan/sh/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/mvdan/sh

.include "../../devel/go-sys/buildlink3.mk"
.include "../../textproc/go-diff/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
