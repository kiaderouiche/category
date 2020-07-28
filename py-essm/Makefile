# $NetBSD$

DISTNAME=	essm-0.4.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/6e/2f/bd6ec3de590af290e6dd2c39d6657518e5fb5c01eb2023fd40ff65f890d9/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/environmentalscience/essm
COMMENT=	Environmental Science using Symbolic Math
#LICENSE=	GPLv2 # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	# TODO: jupyter>=0
BUILD_DEPENDS+=	py-nbconvert>=0:../../www/py-nbconvert
BUILD_DEPENDS+=	# TODO: nbsphinx>=0
BUILD_DEPENDS+=	# TODO: IPython>=0
BUILD_DEPENDS+=	py-ipykernel>=0:../../devel/py-ipykernel
BUILD_DEPENDS+=	# TODO: pytest-runner>=2.6.2
BUILD_DEPENDS+=	py-setuptools_scm>=3.1.0:../../devel/py-setuptools_scm
DEPENDS+=	# TODO: sympy==1.3>=0
DEPENDS+=	py-six>=1.10.0:../../lang/py-six
TEST_DEPENDS+=	# TODO: check-manifest>=0.25
TEST_DEPENDS+=	py-coverage>=4.0:../../devel/py-coverage
TEST_DEPENDS+=	py-isort>=4.2.2:../../devel/py-isort
TEST_DEPENDS+=	# TODO: pydocstyle>=1.0.0,<4.0.0
TEST_DEPENDS+=	# TODO: pytest-cache>=1.0
TEST_DEPENDS+=	# TODO: pytest-cov>=1.8.0
TEST_DEPENDS+=	# TODO: pytest-pep8>=1.0.6
TEST_DEPENDS+=	# TODO: pytest>=2.8.0,<5.0.0

USE_LANGUAGES=	# none

BUILDLINK_DEPENDS.pandoc+=	build
BUILDLINK_API_DEPENDS.pandoc+=	pandoc>=0
.include "../../converters/pandoc/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
