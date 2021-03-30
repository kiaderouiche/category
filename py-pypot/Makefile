# $NetBSD$

DISTNAME=	pypot-4.0.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	comms python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pypot/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/poppy-project/pypot
COMMENT=	Python 3 Library for Robot Control
#LICENSE=	GNU GENERAL PUBLIC LICENSE Version 3 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	# TODO: pyserial>2.6
DEPENDS+=	py-tornado>=0:../../www/py-tornado
DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: ikpy==3.0.1>=0
DEPENDS+=	py-bottle>=0:../../www/py-bottle
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	# TODO: opencv-contrib-python>=0
DEPENDS+=	wget>=0:../../net/wget

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
