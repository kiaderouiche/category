# $NetBSD$

DISTNAME=	altair-4.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ab/21/b2e7de05af65d89c5bf8f716fe2949e4f99a7809530ecb8f8e22a2e1c778/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://altair-viz.github.io
COMMENT=	Altair: A declarative statistical visualization library for Python
#LICENSE=	BSD 3-clause # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	py-black>=0:../../textproc/py-black
BUILD_DEPENDS+=	py-docutils>=0:../../textproc/py-docutils
BUILD_DEPENDS+=	py-ipython>=0:../../devel/py-ipython
BUILD_DEPENDS+=	py-flake8>=0:../../devel/py-flake8
BUILD_DEPENDS+=	# TODO: pytest>=0
BUILD_DEPENDS+=	py-sphinx>=0:../../textproc/py-sphinx
BUILD_DEPENDS+=	py-m2r>=0:../../textproc/py-m2r
BUILD_DEPENDS+=	# TODO: vega_datasets>=0
BUILD_DEPENDS+=	py-recommonmark>=0:../../wip/py-recommonmark
DEPENDS+=	py-entrypoints>=0:../../devel/py-entrypoints
DEPENDS+=	py-jinja2>=0:../../textproc/py-jinja2
DEPENDS+=	py-jsonschema>=0:../../textproc/py-jsonschema
DEPENDS+=	py-pandas>=0.18:../../math/py-pandas
DEPENDS+=	py-toolz>=0:../../devel/py-toolz

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
