# $NetBSD$

DISTNAME=	pixiedust-1.1.18
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pixiedust/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pixiedust/pixiedust
COMMENT=	Productivity library for Jupyter Notebook
LICENSE=	apache-2.0

DEPENDS+=	# TODO: mpld3>=0
DEPENDS+=	${PYPKGPREFIX}-lxml>=0:../../textproc/py-lxml
DEPENDS+=	${PYPKGPREFIX}-geojson>=0:../../geography/py-geojson
DEPENDS+=	${PYPKGPREFIX}-astunparse>=0:../../wip/py-astunparse
DEPENDS+=	${PYPKGPREFIX}-markdown>=0:../../textproc/py-markdown
DEPENDS+=	${PYPKGPREFIX}-colour>=0:../../textproc/py-colour
DEPENDS+=	${PYPKGPREFIX}-requests>=0:../../devel/py-requests

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
