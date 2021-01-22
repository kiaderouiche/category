# $NetBSD$

DISTNAME=	icns-2.0.3
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	icns
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=JackMordaunt/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/JackMordaunt/icns/
COMMENT=	Easily create .icns files with this Go library
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/JackMordaunt/icns

.include "../../devel/go-afero/buildlink3.mk"
.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-pflag/buildlink3.mk"
.include "../../graphics/go-resize/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
