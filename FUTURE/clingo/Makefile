# $NetBSD$

GITHUB_PROJECT=	clingo
GITHUB_TAG=	v5.4.0
DISTNAME=	v5.4.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=potassco/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://potassco.org/clingo/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/clingo-5.4.0

USE_CMAKE=	yes
USE_TOOLS+=	bison
USE_LANGUAGES=	c c++

DEPENDS+= re2c>=1.1.1:../../devel/re2c

.include "../../lang/lua53/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
