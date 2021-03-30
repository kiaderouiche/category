# $NetBSD$

DISTNAME=	pypot-4.0.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	comms python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pypot/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/poppy-project/pypot
COMMENT=	Python 3 Library for Robot Control
LICENSE=		gnu-gpl-v3

DEPENDS+=	${PYPKGPREFIX}-serial>=2.7:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-tornado>=5.1.1:../../www/py-tornado
DEPENDS+=	${PYPKGPREFIX}-scipy>=1.5.2:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-ikpy>=3.0.1:../../wip/py-ikpy
DEPENDS+=	${PYPKGPREFIX}-bottle>=0:../../www/py-bottle
DEPENDS+=	${PYPKGPREFIX}-requests>=2.25.1:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-opencv-contrib-python>=0
DEPENDS+=	wget>=0:../../net/wget


.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
