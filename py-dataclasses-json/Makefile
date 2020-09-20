# $NetBSD$

DISTNAME=	dataclasses-json-0.5.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	https://files.pythonhosted.org/packages/11/1b/f10675e21894318b7f208a92d09b9a1cea7c0a06a5b10cefcb4c74af8855/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/lidatong/dataclasses-json
COMMENT=	Easily serialize dataclasses to and from JSON
LICENSE=	mit

BUILD_DEPENDS+=	# TODO: pytest>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-ipython>=0:../../devel/py-ipython
BUILD_DEPENDS+=	${PYPKGPREFIX}-mypy>=0.710:../../lang/py-mypy
BUILD_DEPENDS+=	${PYPKGPREFIX}-hypothesis>=0:../../devel/py-hypothesis
BUILD_DEPENDS+=	${PYPKGPREFIX}-portray>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=0:../../devel/py-flake8
BUILD_DEPENDS+=	${PYPKGPREFIX}-simplejson>=0:../../converters/py-simplejson
DEPENDS+=	# TODO: ${PYPKGPREFIX}-dataclasses;python_version=="3.6">=0
DEPENDS+=	# TODO: ${PYPKGPREFIX}-marshmallow>=3.3.0,<4.0.0
DEPENDS+=	# TODO: ${PYPKGPREFIX}-marshmallow-enum>=1.5.1,<2.0.0
DEPENDS+=	# TODO: ${PYPKGPREFIX}-typing-inspect>=0.4.0
DEPENDS+=	# TODO: ${PYPKGPREFIX}-stringcase==1.2.0,<2.0.0>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
