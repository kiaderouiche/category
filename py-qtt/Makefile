# $NetBSD$

DISTNAME=	qtt-1.2.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f6/97/ffe957c0c3e39f702cfd64650f9513bf6255c0480ab3b05410bcc6faac0e/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://qutech.nl
COMMENT=	Python-based framework for analysis and tuning of quantum dots
LICENSE=	mit

DEPENDS+=	# TODO: apscheduler>=0
DEPENDS+=	${PYPKGPREFIX}-attrs>=0:../../devel/py-attrs
DEPENDS+=	${PYPKGPREFIX}-dulwich>=0:../../devel/py-dulwich
DEPENDS+=	py-h5py>=0:../../devel/py-h5py
DEPENDS+=	# TODO: hickle>=0
DEPENDS+=	# TODO: IPython>=0.1
DEPENDS+=	${PYPKGPREFIX}-lmfit>=0:../../math/py-lmfit
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=3.0:../../graphics/py-matplotlib
DEPENDS+=	# TODO: opencv-python>=0
DEPENDS+=	# TODO: PyQt5>=0
DEPENDS+=	# TODO: pyqtgraph>=0
DEPENDS+=	# TODO: pyvisa>=0
DEPENDS+=	# TODO: pyzmqrpc>=0
DEPENDS+=	${PYPKGPREFIX}-qcodes>=0.8.0:../../category/py-qcodes
DEPENDS+=	# TODO: qcodes-contrib-drivers>=0
DEPENDS+=	${PYPKGPREFIX}-qilib>=0:../../category/py-qilib
DEPENDS+=	${PYPKGPREFIX}-qtpy>=0:../../wip/py-qtpy
DEPENDS+=	# TODO: qupulse>=0
DEPENDS+=	${PYPKGPREFIX}-redis>=0:../../databases/py-redis
DEPENDS+=	${PYPKGPREFIX}-scipy>=0.18:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-scikit-image>=0:../../math/py-scikit-image
DEPENDS+=	# TODO: jupyter>=0
DEPENDS+=	${PYPKGPREFIX}-coverage>=0:../../devel/py-coverage
DEPENDS+=	${PYPKGPREFIX}-sympy>=0:../../math/py-sympy
DEPENDS+=	${PYPKGPREFIX}-numdifftools>=0:../../wip/py-numdifftools
DEPENDS+=	${PYPKGPREFIX}-coverage>=0:../../devel/py-coverage
DEPENDS+=	# TODO: jupyter>=0
DEPENDS+=	${PYPKGPREFIX}-mypy>=0:../../lang/py-mypy
DEPENDS+=	# TODO: pytest>=0
DEPENDS+=	# TODO: Polygon3>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-coverage>=0:../../devel/py-coverage
TEST_DEPENDS+=	# TODO: jupyter>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-mypy>=0:../../lang/py-mypy
TEST_DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.15
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
