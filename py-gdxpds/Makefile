# $NetBSD$

DISTNAME=	gdxpds-1.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=   ${MASTER_SITE_PYPI:=g/gdxpds/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/NREL/gdx-pandas
COMMENT=	Translate between gdx (GAMS data) and pandas
#LICENSE=	# TODO: (see mk/license.mk)

PYTHON_VERSIONS_INCOMPATIBLE=   27

DEPENDS+=	${PYPKGPREFIX}-future>=0.18.2:../../devel/py-future
#DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas

USE_LANGUAGES=	# none

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
