# $NetBSD$

DISTNAME=	sidekick-0.8.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	lang python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/sidekick/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/fabiommendes/sidekick/
COMMENT=	Functional programming library for Python
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE+=	27

BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=3.9.0:../../devel/py-flake8
BUILD_DEPENDS+=	${PYPKGPREFIX}-black>=20.8b1:../../textproc/py-black
BUILD_DEPENDS+=	${PYPKGPREFIX}-readme_renderer>=28.0:../../textproc/py-readme_renderer
DEPENDS+=	${PYPKGPREFIX}-toolz>=0.10.0:../../devel/py-toolz


.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
