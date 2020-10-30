# $NetBSD$

GITHUB_PROJECT=	RepositoryHandler
GITHUB_TAG=	0.5
DISTNAME=	0.5
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GITHUB:=MetricsGrimoire/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://projects.libresoft.es/projects/repositoryhandler
COMMENT=	Python library for handling code repositories
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/RepositoryHandler-0.5

USE_LANGUAGES=	# none

# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
