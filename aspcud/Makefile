# $NetBSD$

GITHUB_PROJECT=	aspcud
GITHUB_TAG=	v1.9.4
DISTNAME=	v1.9.4
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=potassco/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://potassco.org/aspcud/
COMMENT=	Advanced solver for package dependencies
LICENSE=	mit

WRKSRC=		${WRKDIR}/aspcud-1.9.4

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

BUILD_DEPENDS+=	re2c>=1.1.1:../../devel/re2c

.include "../../devel/boost-libs/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
