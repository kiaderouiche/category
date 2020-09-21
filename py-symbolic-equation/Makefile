# $NetBSD$

DISTNAME=	symbolic_equation-0.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/1c/a3/075eebd0186279c12eabd4466dcbbac2b57f39991151f3c1bbef34de6f7f/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/goerz/symbolic_equation
COMMENT=	Class for multiline symbolic equations in the Jupyter Notebook
LICENSE=	modified-bsd

BUILD_DEPENDS+=	${PYPKGPREFIX}-black>=20.8:../../wip/py-black
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage>=5.2.1:../../devel/py-coverage
BUILD_DEPENDS+=	${PYPKGPREFIX}-coveralls>=2.4.2:../../wip/py-coveralls
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=3.8.3:../../devel/py-flake8
BUILD_DEPENDS+=	${PYPKGPREFIX}-gitpython>=3.1.8:../../devel/py-gitpython
BUILD_DEPENDS+=	${PYPKGPREFIX}-isort>=0:../../devel/py-isort
BUILD_DEPENDS+=	${PYPKGPREFIX}-ipython>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-jupyter>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-nbsphinx>=0:../../wip/py-nbsphinx
BUILD_DEPENDS+=	${PYPKGPREFIX}-nbval>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-pre-commit>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-pylint>=0:../../devel/py-pylint
BUILD_DEPENDS+=	${PYPKGPREFIX}-test>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-cov>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-xdist>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-sympy>=1.6.2:../../math/py-sympy
BUILD_DEPENDS+=	${PYPKGPREFIX}-twine>=1.13.0:../../net/py-twine
BUILD_DEPENDS+=	${PYPKGPREFIX}-watermark>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-wheel>=0:../../devel/py-wheel

DEPENDS+=	${PYPKGPREFIX}-uniseg>=0:../../devel/py-wheel

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
