# $NetBSD$

DISTNAME=	pyviz-0.10.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	graphics python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pyviz/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://pyviz.org/
COMMENT=	How to solve visualization problems with Python tools
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-xarray>=0.15.1:../../math/py-xarray
DEPENDS+=	${PYPKGPREFIX}-bokeh>=2.2.2:../../wip/py-bokeh
DEPENDS+=	${PYPKGPREFIX}-ct>=0.4.8:../../wip/py-ct
DEPENDS+=	${PYPKGPREFIX}-param>=1.10.0:../../wip/py-param
DEPENDS+=	${PYPKGPREFIX}-panel>=0.10.2:../../wip/py-panel

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
