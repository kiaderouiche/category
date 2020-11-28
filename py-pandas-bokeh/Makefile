# $NetBSD$

DISTNAME=	pandas-bokeh-0.5.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pandas-bokeh/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/PatrikHlobil/Pandas-Bokeh
COMMENT=	Bokeh plotting backend for Pandas, GeoPandas & Pyspark
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-pandas>=0.22.0:../../math/py-pandas
#DEPENDS+=	${PYPKGPREFIX}-bokeh-[0-9]*:../../wip/py-bokeh

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
