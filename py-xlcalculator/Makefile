# $NetBSD$

DISTNAME=	xlcalculator-0.2.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f6/7c/6919fd1c516edb0b4574086776e625ad8d6bca59e6c8aee62ce85817d133/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/bradbase/xlcalculator
COMMENT=	Converts MS Excel formulas to Python and evaluates them
#LICENSE=	GPL 3.0 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-jsonpickle>=0:../../textproc/py-jsonpickle
DEPENDS+=	${PYPKGPREFIX}-pandas>=0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-openpyxl>=0:../../textproc/py-openpyxl
DEPENDS+=	${PYPKGPREFIX}-numpy_financial>=0
DEPENDS+=	${PYPKGPREFIX}-yearfrac==0.4.4>=0
DEPENDS+=	${PYPKGPREFIX}-mock>=0:../../devel/py-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-coverage>=0:../../devel/py-coverage
TEST_DEPENDS+=	${PYPKGPREFIX}-flake8>=0:../../devel/py-flake8
TEST_DEPENDS+=	${PYPKGPREFIX}-mock>=0:../../devel/py-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=0:../../devel/py-test
TEST_DEPENDS+=	${PYPKGPREFIX}-test-cov>=0:../../devel/py-test-cov

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
