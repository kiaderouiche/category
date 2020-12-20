# $NetBSD$

DISTNAME=	holoviews-1.13.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_PYPI:=h/holoviews/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://files.pythonhosted.org/packages/de/c8/f2209ef5d56d47206cc541266c1a66de86ed2ce80ccd8dbd69598f0f2c0e/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-numpy>=1.19.4:../../math/py-numpy
DEPENDS+=	${PYPKGPREFIX}-xarray>=0.15.1:../../math/py-xarray
DEPENDS+=	${PYPKGPREFIX}-colorcet>=2.0.2:../../wip/py-colorcet
DEPENDS+=	${PYPKGPREFIX}-ct>=0.4.8:../../wip/py-ct
DEPENDS+=	${PYPKGPREFIX}-dask-[0-9]*:../../wip/py-dask
DEPENDS+=	${PYPKGPREFIX}-param>=1.10.0:../../wip/py-param

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
