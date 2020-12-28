# $NetBSD$

DISTNAME=	go-dkron-3.1.1
GITHUB_PROJECT=	dkron
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=distribworks/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/distribworks/dkron/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=	github.com/distribworks/dkron
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../wip/go-circbuf/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
