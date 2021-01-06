# $NetBSD$

DISTNAME=	go-beego-2.0.1
GITHUB_PROJECT=	beego
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=beego/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/beego/beego/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=     github.com/beego/beego
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-golang-lru/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
