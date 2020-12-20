# $NetBSD$

DISTNAME=	holoviews-1.14.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	graphics python
MASTER_SITES=	${MASTER_SITE_PYPI:=h/holoviews/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://www.holoviews.org
COMMENT=	Stop plotting your data - annotate your data and let it visualize itself
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-param>=1.10.0:../../wip/py-param
DEPENDS+=	# TODO: pyviz_comms>=0.7.3
DEPENDS+=	# TODO: panel>=0.8.0
DEPENDS+=	${PYPKGPREFIX}-colorcet>=2.0.2:../../wip/py-colorcet
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
