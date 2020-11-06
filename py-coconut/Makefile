# $NetBSD$

DISTNAME=	coconut-1.4.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	lang python
MASTER_SITES=	https://files.pythonhosted.org/packages/49/bd/c77663bf5525bcb3c0995ebe0257cc5a9ef6d191cdb354faccc9841afe99/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://coconut-lang.org
COMMENT=	Simple, elegant, Pythonic functional programming
LICENSE=	apache-2.0

BUILD_DEPENDS+=	${PYPKGPREFIX}-ipython>=6.5,<7.11:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-jupyter-console>=5.2
BUILD_DEPENDS+=	${PYPKGPREFIX}-pyparsing>=2.4.5,<2.4.6:../../devel/py-pyparsing
BUILD_DEPENDS+=	${PYPKGPREFIX}-psutil>=5:../../sysutils/py-psutil
BUILD_DEPENDS+=	${PYPKGPREFIX}-vprof>=0.36
BUILD_DEPENDS+=	${PYPKGPREFIX}-requests>=2:../../devel/py-requests
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx>=1.7.4,<1.7.5:../../textproc/py-sphinx
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx_bootstrap_theme>=0.4,<0.5
BUILD_DEPENDS+=	${PYPKGPREFIX}-jupyter>=1.0
BUILD_DEPENDS+=	${PYPKGPREFIX}-ipykernel>=5.1:../../devel/py-ipykernel
BUILD_DEPENDS+=	${PYPKGPREFIX}-test>=3
BUILD_DEPENDS+=	${PYPKGPREFIX}-recommonmark>=0.6:../../wip/py-recommonmark
BUILD_DEPENDS+=	${PYPKGPREFIX}-watchdog>=0.9:../../sysutils/py-watchdog
BUILD_DEPENDS+=	${PYPKGPREFIX}-pygments>=2.3.1:../../textproc/py-pygments
BUILD_DEPENDS+=	${PYPKGPREFIX}-pexpect>=4:../../devel/py-pexpect
BUILD_DEPENDS+=	${PYPKGPREFIX}-mypy>=0.761,<0.762:../../lang/py-mypy
BUILD_DEPENDS+=	pre-commit>=1:../../wip/pre-commit
DEPENDS+=	${PYPKGPREFIX}-cPyparsing>=2.4.5.0.1.1,<2.4.5.0.1.2
DEPENDS+=	${PYPKGPREFIX}-pygments>=2.3.1:../../textproc/py-pygments
DEPENDS+=	${PYPKGPREFIX}-prompt_toolkit>=1:../../devel/py-prompt_toolkit

USE_LANGUAGES=	# none

BUILDLINK_DEPENDS.py-numpy+=	build
BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
