# $NetBSD$

DISTNAME=	pipenv-2020.8.13
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/cc/0a/ed147c6bb2245ac9b275ef28db37b338181f1afe696317e0372786b57107/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/pypa/pipenv
COMMENT=	Python Development Workflow for Humans
LICENSE=	mit

BUILD_DEPENDS+=	${PYPKGPREFIX}-towncrier>=0
BUILD_DEPENDS+=	# TODO: bs4>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-twine>=0:../../net/py-twine
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx<2>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=3.3.0,<4.0:../../devel/py-flake8
BUILD_DEPENDS+=	${PYPKGPREFIX}-black>=
BUILD_DEPENDS+=	${PYPKGPREFIX}-parver>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-invoke>=0
DEPENDS+=	${PYPKGPREFIX}-pip>=18.0:../../devel/py-pip
DEPENDS+=	${PYPKGPREFIX}-certifi>=0:../../security/py-certifi
DEPENDS+=	${PYPKGPREFIX}-virtualenv-clone>=0.2.5:../../wip/py-virtualenv-clone
DEPENDS+=	${PYPKGPREFIX}-virtualenv>=0:../../devel/py-virtualenv
DEPENDS+=	# TODO: typing;python_version<"3.5">=0

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
