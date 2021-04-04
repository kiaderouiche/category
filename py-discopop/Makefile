# $NetBSD$

DISTNAME=	discopop-1.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	parallel python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/discopop/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://www.discopop.tu-darmstadt.de/
COMMENT=	Software developers parallelize their programs with threads
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-matplotlib>=3.3.4:../../graphics/py-matplotlib
DEPENDS+=	${PYPKGPREFIX}-networkx>=2.5:../../math/py-networkx
DEPENDS+=	${PYPKGPREFIX}-pluginbase>=1.0.0:../../wip/py-pluginbase
DEPENDS+=	${PYPKGPREFIX}-contextlib2>=0.5.5:../../devel/py-contextlib2
DEPENDS+=	${PYPKGPREFIX}-docopt>=0.6.2:../../devel/py-docopt
DEPENDS+=	${PYPKGPREFIX}-lxml>=4.3.3:../../textproc/py-lxml
DEPENDS+=	${PYPKGPREFIX}-schema>=0.7.0:../../wip/py-schema


BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.16.3
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
