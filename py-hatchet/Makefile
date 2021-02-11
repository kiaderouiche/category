# $NetBSD$

DISTNAME=	hatchet-1.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=h/hatchet/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/LLNL/hatchet
COMMENT=	Python library for analyzing hierarchical performance data
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-dot>=1.4.1:../../graphics/py-dot
DEPENDS+=	${PYPKGPREFIX}-yaml>=0:../../
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	${PYPKGPREFIX}-pandas>=0:../../math/py-pandas

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
