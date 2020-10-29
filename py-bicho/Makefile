# $NetBSD$

GITHUB_PROJECT=	Bicho
GITHUB_TAG=	0.9.1
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${PYPKGPREFIX}-${GITHUB_PROJECT:tl}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GITHUB:=MetricsGrimoire/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/MetricsGrimoire/Bicho
COMMENT=	Bug tracking system tool analyzer
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/Bicho-0.9.1

#PYTHON_VERSIONS_ACCEPTED=	27

DEPENDS+=	${PYPKGPREFIX}-beautifulsoup4>=4.3.2:../../www/py-beautifulsoup4
#DEPENDS+=	${PYPKGPREFIX}-storm>=0.20:../../wip/py-storm

post-extract:
	${MV} ${WRKSRC}/bin/bicho ${WRKSRC}/bin/bicho${PYVERSSUFFIX}

.include "../../lang/python/application.mk"
.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
