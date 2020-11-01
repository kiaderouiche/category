# $NetBSD$

GITHUB_PROJECT=	RepositoryHandler
GITHUB_TAG=	0.5
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${PYPKGPREFIX}-${GITHUB_PROJECT:tl}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GITHUB:=MetricsGrimoire/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://metricsgrimoire.github.io/RepositoryHandler/
COMMENT=	Python library for handling code repositories
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/RepositoryHandler-0.5

USE_LANGUAGES=	# none

DEPENDS+=       git>=2.28.0:../../devel/git

.include "../../devel/subversion-base/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
