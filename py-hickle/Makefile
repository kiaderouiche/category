# $NetBSD$

DISTNAME=	hickle-4.0.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/a8/4c/ec0afc58c33d482756cd75e7a48f9e9152199b6bcbe73f373f7a89c2305e/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://github.com/telegraphic/hickle
COMMENT=	Hickle - an HDF5 based version of pickle
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: dill>=0.3.0
DEPENDS+=	py-h5py>=2.8.0:../../devel/py-h5py
DEPENDS+=	py-six>=1.11.0:../../lang/py-six
TEST_DEPENDS+=	# TODO: codecov>=0
TEST_DEPENDS+=	# TODO: pytest>=4.6.0
TEST_DEPENDS+=	py-pytest-cov>=0:../../wip/py-pytest-cov
TEST_DEPENDS+=	# TODO: astropy>=1.3,<4.0
TEST_DEPENDS+=	py-scipy>=1.0.0:../../math/py-scipy
TEST_DEPENDS+=	py-pandas>=0.24.0:../../math/py-pandas
TEST_DEPENDS+=	py-check-manifest>=0:../../wip/py-check-manifest
TEST_DEPENDS+=	py-twine>=1.13.0:../../net/py-twine

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.8
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
