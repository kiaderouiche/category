# $NetBSD$

DISTNAME=	nameko-2.13.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=n/nameko/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://github.com/nameko/nameko
COMMENT=	Microservices framework for Python
LICENSE=	apache-2.0

BUILD_DEPENDS+=	${PYPKGPREFIX}-astroid>=2.4.2:../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage>=4.5.1:../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=3.3.0:../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-isort>=4.2.15:../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-mccabe==0.6.1>=:0../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-codestyle==2.3.1>=:0../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-pyflakes==1.5.0>=:0../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-lint==1.7.1>=:0../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-test==4.3.1>=:0../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-cov==2.5.1>=:0../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-timeout==1.3.3>=:0../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-urllib3==1.23>=:0../../www/py-websocket-client
BUILD_DEPENDS+=	${PYPKGPREFIX}-websocket-client>=0.48.0:../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-dns>=0:../../net/py-dns../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-eventlet>=0.20.1:../../wip/py-eventlet../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-kombu>=4.2.0,<5:../../net/py-kombu../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-mock>=1.2:../../devel/py-mock../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-path.py>=6.2:../../devel/py-path.py../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-yaml>=5.1:../../textproc/py-yaml../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-requests>=1.2.0:../../devel/py-requests../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-six>=1.9.0:../../lang/py-six../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-werkzeug>=0.9:../../www/py-werkzeug../../www/py-websocket-client
DEPENDS+=	${PYPKGPREFIX}-wrapt>=1.0.0:../../devel/py-wrapt../../www/py-websocket-client

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
