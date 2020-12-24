# $NetBSD$

DISTNAME=	altair-4.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/altair/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://altair-viz.github.io
COMMENT=	Altair: A declarative statistical visualization library for Python
#LICENSE=	BSD 3-clause # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	${PYPKGPREFIX}-black>=0:../../textproc/py-black
BUILD_DEPENDS+=	${PYPKGPREFIX}-docutils>=0.16:../../textproc/py-docutils
BUILD_DEPENDS+=	${PYPKGPREFIX}-ipython>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=3.3.0:../../devel/py-flake8
BUILD_DEPENDS+=	${PYPKGPREFIX}-test>=4.3.1:../../devel/py-test
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx>=2.4.4:../../textproc/py-sphinx
BUILD_DEPENDS+=	${PYPKGPREFIX}-m2r>=0:../../textproc/py-m2r
BUILD_DEPENDS+=	${PYPKGPREFIX}-vega_datasets>=0:../../wip/py-vega_datasets
BUILD_DEPENDS+=	${PYPKGPREFIX}-recommonmark>=0:../../wip/py-recommonmark
DEPENDS+=	${PYPKGPREFIX}-entrypoints>=0:../../devel/py-entrypoints
DEPENDS+=	${PYPKGPREFIX}-jinja2>=0:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-jsonschema>=0:../../textproc/py-jsonschema
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.18:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-toolz>=0:../../devel/py-toolz

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
