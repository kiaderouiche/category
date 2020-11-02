# $NetBSD$

DISTNAME=	streamlit-0.70.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=   ${MASTER_SITE_PYPI:=s/streamlit/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://www.streamlit.io/
COMMENT=	The fastest way to build data apps in Python
LICENSE=	apache-2.0

DEPENDS+=	${PYPKGPREFIX}-click>=7.1.2:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=3.2.2:../../graphics/py-matplotlib
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
