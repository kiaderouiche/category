# $NetBSD$

DISTNAME=	datashader-0.11.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	cgraphics python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/datashader/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://datashader.org
COMMENT=	Data visualization toolchain based on aggregating into a grid
#LICENSE=	New BSD # TODO: from setup.py; needs to be adjusted

#DEPENDS+=	${PYPKGPREFIX}-dask>=0.18.0:../../wip/py-dask
#DEPENDS+=	${PYPKGPREFIX}-toolz>=0.7.4:../../devel/py-toolz
#DEPENDS+=	${PYPKGPREFIX}-datashape>=0.5.1:../../wip/py-datashape
#DEPENDS+=	${PYPKGPREFIX}-numba>=0.37.0:../../math/py-numba
#DEPENDS+=	${PYPKGPREFIX}-pandas>=0.24.1:../../math/py-pandas
#DEPENDS+=	${PYPKGPREFIX}-Pillow>=3.1.1:../../graphics/py-Pillow
#DEPENDS+=	${PYPKGPREFIX}-xarray>=0.9.6:../../math/py-xarray
#DEPENDS+=	${PYPKGPREFIX}-colorcet>=0.9.0:../../wip/py-colorcet
#DEPENDS+=	${PYPKGPREFIX}-param>=1.6.0:../../wip/py-param
#DEPENDS+=	${PYPKGPREFIX}-ct>=0.4.6:../../wip/py-ct
#DEPENDS+=	${PYPKGPREFIX}-bokeh>=0:../../wip/py-bokeh
#DEPENDS+=	${PYPKGPREFIX}-scipy>=0:../../math/py-scipy

DEPENDS+=	# TODO: dask[complete]>=0.18.0
DEPENDS+=	py-toolz>=0.7.4:../../devel/py-toolz
DEPENDS+=	py-datashape>=0.5.1:../../category/py-datashape
DEPENDS+=	py-numba>=0.37.0,!=0.49.*,!=0.50.*:../../math/py-numba
DEPENDS+=	py-pandas>=0.24.1:../../math/py-pandas
DEPENDS+=	# TODO: pillow>=3.1.1
DEPENDS+=	py-xarray>=0.9.6:../../math/py-xarray
DEPENDS+=	# TODO: colorcet>=0.9.0
DEPENDS+=	py-param>=1.6.0:../../wip/py-param
DEPENDS+=	# TODO: pyct[cmd]==0.4.6>=0
DEPENDS+=	py-bokeh>=0:../../wip/py-bokeh
DEPENDS+=	# TODO: scipy>=0
TEST_DEPENDS+=	# TODO: pytest>=3.9.3,<6.0
TEST_DEPENDS+=	# TODO: pytest-benchmark>=3.0.0
TEST_DEPENDS+=	# TODO: pytest-cov>=0
TEST_DEPENDS+=	py-codecov>=0:../../wip/py-codecov
TEST_DEPENDS+=	py-flake8>=0:../../devel/py-flake8
TEST_DEPENDS+=	# TODO: nbsmoke[all]>=0.4.0
TEST_DEPENDS+=	# TODO: fastparquet>=0.1.6
TEST_DEPENDS+=	# TODO: holoviews>=1.10.0
TEST_DEPENDS+=	# TODO: pyarrow>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.7
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
