# $NetBSD$

GITHUB_PROJECT=	vcpkg
GITHUB_TAG=	2020.07
DISTNAME=	2020.07
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=microsoft/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/microsoft/vcpkg/
COMMENT=	TODO: Short description of the package
LICENSE=	mit

WRKSRC=		${WRKDIR}/vcpkg-2020.07

USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	ports/bzip2/bzip2.pc.in

.include "../../mk/bsd.pkg.mk"
