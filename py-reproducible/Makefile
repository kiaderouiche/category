# $NetBSD$

GITHUB_PROJECT=	reproducible
GITHUB_TAG=	v0.4.0
DISTNAME=	v0.4.0
PKGNAME=	${PYPKGPREFIX}-${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GITHUB:=oist-cnru/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/oist-cnru/reproducible
COMMENT=	Reproducible library
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-gitpython>=0:../../devel/py-gitpython
DEPENDS+=	${PYPKGPREFIX}-yaml>=0
DEPENDS+=	${PYPKGPREFIX}-cpuinfo<5.0.0>=0

WRKSRC=		${WRKDIR}/reproducible-0.4.0

USE_LANGUAGES=	# none

# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
