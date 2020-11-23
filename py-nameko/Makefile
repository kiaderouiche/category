# $NetBSD$

DISTNAME=	nameko-2.13.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/6a/0c/cf5bbcfc6bcfd5c6b74914ee96cc7ba57d7bdd9bdfe611ca83365601a279/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/nameko/nameko
COMMENT=	A microservices framework for Python that lets service developers concentrate on application logic and encourages testability
#LICENSE=	Apache License, Version 2.0 # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	# TODO: astroid==1.6.5>=0
BUILD_DEPENDS+=	# TODO: coverage==4.5.1>=0
BUILD_DEPENDS+=	# TODO: flake8==3.3.0>=0
BUILD_DEPENDS+=	# TODO: isort==4.2.15>=0
BUILD_DEPENDS+=	# TODO: mccabe==0.6.1>=0
BUILD_DEPENDS+=	# TODO: pycodestyle==2.3.1>=0
BUILD_DEPENDS+=	# TODO: pyflakes==1.5.0>=0
BUILD_DEPENDS+=	# TODO: pylint==1.7.1>=0
BUILD_DEPENDS+=	# TODO: pytest==4.3.1>=0
BUILD_DEPENDS+=	# TODO: pytest-cov==2.5.1>=0
BUILD_DEPENDS+=	# TODO: pytest-timeout==1.3.3>=0
BUILD_DEPENDS+=	# TODO: requests==2.19.1>=0
BUILD_DEPENDS+=	# TODO: urllib3==1.23>=0
BUILD_DEPENDS+=	# TODO: websocket-client==0.48.0>=0
DEPENDS+=	# TODO: dnspython<2>=0
DEPENDS+=	py-eventlet>=0.20.1:../../wip/py-eventlet
DEPENDS+=	py-kombu>=4.2.0,<5:../../net/py-kombu
DEPENDS+=	py-mock>=1.2:../../devel/py-mock
DEPENDS+=	py-path.py>=6.2:../../devel/py-path.py
DEPENDS+=	# TODO: pyyaml>=5.1
DEPENDS+=	py-requests>=1.2.0:../../devel/py-requests
DEPENDS+=	py-six>=1.9.0:../../lang/py-six
DEPENDS+=	py-werkzeug>=0.9:../../www/py-werkzeug
DEPENDS+=	py-wrapt>=1.0.0:../../devel/py-wrapt

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
