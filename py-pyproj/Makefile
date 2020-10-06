# $NetBSD$

DISTNAME=	pyproj-2.6.1.post1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	geography
MASTER_SITES=	https://files.pythonhosted.org/packages/a8/f9/e7876096af700e7987f5e5abffa09b783ab31157083f76cd88c83e3dbe95/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/pyproj4/pyproj
COMMENT=	Cartographic projections and coordinate transformations library
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE= 27

.include "../../devel/py-cython/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
