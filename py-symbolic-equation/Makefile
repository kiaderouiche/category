# $NetBSD$

DISTNAME=	symbolic_equation-0.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/1c/a3/075eebd0186279c12eabd4466dcbbac2b57f39991151f3c1bbef34de6f7f/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/goerz/symbolic_equation
COMMENT=	A class for multiline symbolic equations in the Jupyter Notebook
#LICENSE=	BSD license # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	# TODO: black>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage>=0:../../devel/py-coverage
BUILD_DEPENDS+=	# TODO: coveralls>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=0:../../devel/py-flake8
BUILD_DEPENDS+=	# TODO: gitpython>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-isort>=0:../../devel/py-isort
BUILD_DEPENDS+=	${PYPKGPREFIX}-ipython>=0:../../devel/py-ipython
BUILD_DEPENDS+=	# TODO: jupyter>=0
BUILD_DEPENDS+=	# TODO: nbsphinx>=0
BUILD_DEPENDS+=	# TODO: nbval>=0
BUILD_DEPENDS+=	# TODO: pre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pylint>=0:../../devel/py-pylint
BUILD_DEPENDS+=	# TODO: pytest>=0
BUILD_DEPENDS+=	# TODO: pytest-cov>=0
BUILD_DEPENDS+=	# TODO: pytest-xdist>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sympy>=1.5.1:../../math/py-sympy
BUILD_DEPENDS+=	${PYPKGPREFIX}-twine>=1.13.0:../../net/py-twine
BUILD_DEPENDS+=	# TODO: watermark>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-wheel>=0:../../devel/py-wheel
DEPENDS+=	# TODO: uniseg>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
