# $NetBSD$

DISTNAME=	streamlit-0.70.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=   ${MASTER_SITE_PYPI:=s/streamlit/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://www.streamlit.io/
COMMENT=	The fastest way to build data apps in Python
LICENSE=	apache-2.0

PYTHON_VERSIONS_INCOMPATIBLE=   27

DEPENDS+=	${PYPKGPREFIX}-blinker>=1.4:../../devel/py-blinker
DEPENDS+=	${PYPKGPREFIX}-click>=7.1.2:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-requests>=2.24.0:../../devel/py-requests
#DEPENDS+=	${PYPKGPREFIX}-toml>=0.10.2:../../textproc/py-toml
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=3.2.2:../../graphics/py-matplotlib
#DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-pipenv-[0-9]*:../../wip/py-pipenv
#DEPENDS+=	${PYPKGPREFIX}-tornado>=5.1.1:../../www/py-tornado

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
