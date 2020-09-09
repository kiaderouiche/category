# $NetBSD$

DISTNAME=	einsteinpy_geodesics-0.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b6/8a/54ac0cfe8af60bd898631f16f03a23c78f72e8a3c7e7b372cbbf306c867e/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/einsteinpy/einsteinpy-geodesics
COMMENT=	====================
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-black>=0:../../wip/py-black
BUILD_DEPENDS+=	py-coverage>=0:../../devel/py-coverage
BUILD_DEPENDS+=	py-hypothesis>=0:../../devel/py-hypothesis
BUILD_DEPENDS+=	py-isort>=0:../../devel/py-isort
BUILD_DEPENDS+=	py-mypy>=0.740:../../lang/py-mypy
BUILD_DEPENDS+=	# TODO: pycodestyle>=0
BUILD_DEPENDS+=	# TODO: pytest>=3.2
BUILD_DEPENDS+=	# TODO: pytest-cov<2.6.0>=0
BUILD_DEPENDS+=	# TODO: pytest-doctestplus>=0
BUILD_DEPENDS+=	# TODO: pytest-mpl>=0
BUILD_DEPENDS+=	# TODO: pytest-mypy>=0
BUILD_DEPENDS+=	# TODO: pytest-remotedata>=0
BUILD_DEPENDS+=	py-sphinx>=0:../../textproc/py-sphinx
BUILD_DEPENDS+=	py-alabaster>=0:../../textproc/py-alabaster
BUILD_DEPENDS+=	py-tox>=0:../../devel/py-tox

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
