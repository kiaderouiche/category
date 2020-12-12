# $NetBSD$

DISTNAME=	datashader-0.11.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/datashader/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://datashader.org
COMMENT=	Data visualization toolchain based on aggregating into a grid
#LICENSE=	New BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-dask>=0.18.0:../../wip/py-dask
DEPENDS+=	${PYPKGPREFIX}-toolz>=0.7.4:../../devel/py-toolz
DEPENDS+=	${PYPKGPREFIX}-datashape>=0.5.1:../../wip/py-datashape
DEPENDS+=	${PYPKGPREFIX}-numba>=0.37.0:../../math/py-numba
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.24.1:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-Pillow>=3.1.1:../../graphics/py-Pillow
DEPENDS+=	${PYPKGPREFIX}-xarray>=0.9.6:../../math/py-xarray
DEPENDS+=	${PYPKGPREFIX}-colorcet>=0.9.0:../../wip/py-colorcet
DEPENDS+=	${PYPKGPREFIX}-param>=1.6.0:../../wip/py-param
DEPENDS+=	${PYPKGPREFIX}-ct>=0.4.6:../../wip/py-ct
DEPENDS+=	${PYPKGPREFIX}-bokeh>=0:../../wip/py-bokeh
DEPENDS+=	${PYPKGPREFIX}-scipy>=0:../../math/py-scipy


USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.7
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
