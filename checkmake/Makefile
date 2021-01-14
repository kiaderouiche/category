# $NetBSD$

DISTNAME=	checkmake-20200922
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	checkmake
GITHUB_TAG=	575315c9924da41534a9d0ce91c3f0d19bb53ffc
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=mrtazz/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mrtazz/checkmake/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/mrtazz/checkmake

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
