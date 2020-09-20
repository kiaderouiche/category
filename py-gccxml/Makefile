# $NetBSD$

GITHUB_PROJECT=	pygccxml
GITHUB_TAG=	v2.0.1
DISTNAME=	v2.0.1
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	python textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=CastXML/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamel.derouiche@gmail.com
HOMEPAGE=	https://github.com/CastXML/pygccxml
COMMENT=	Python package for easy C++ declarations navigation
#LICENSE=	Boost # TODO: from setup.py; needs to be adjusted

WRKSRC=		${WRKDIR}/pygccxml-2.0.1

USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake

# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
