# $NetBSD$

GITHUB_PROJECT=	clingo
GITHUB_TAG=	v5.4.1
DISTNAME=	v5.4.1
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=potassco/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://potassco.org/clingo/
COMMENT=	Grounder and solver for logic programs
LICENSE=	mit

WRKSRC=		${WRKDIR}/clingo-5.4.1

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

DEPENDS+= re2c>=1.1.1:../../devel/re2c

.include "../../mk/bsd.pkg.mk"
