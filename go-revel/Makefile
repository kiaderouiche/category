# $NetBSD$

DISTNAME=	go-revel-1.0.0
GITHUB_PROJECT=	revel
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=revel/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/revel/revel/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/go-gl/${GITHUB_PROJECT}

.include "../../devel/go-fsnotify/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
