# $NetBSD$

DISTNAME=	pipenv-2020.8.13
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=   ${MASTER_SITE_PYPI:=p/pipenv/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pypa/pipenv
COMMENT=	Python Development Workflow for Humans
LICENSE=	mit

BUILD_DEPENDS+=	${PYPKGPREFIX}-towncrier>=0:../../devel/py-towncrier
BUILD_DEPENDS+=	# TODO: bs4>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-twine>=1.13.0:../../net/py-twine
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx>=2.4.4:../../textproc/py-sphinx
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=3.3.0,<4.0:../../devel/py-flake8
BUILD_DEPENDS+=	${PYPKGPREFIX}-black>=20.8:../../devel/py-black
BUILD_DEPENDS+=	${PYPKGPREFIX}-parver>=0.3.1:../../devel/py-parver
BUILD_DEPENDS+=	${PYPKGPREFIX}-invoke>=0
DEPENDS+=	${PYPKGPREFIX}-pip>=18.0:../../devel/py-pip
DEPENDS+=	${PYPKGPREFIX}-certifi-[0-9]*:../../security/py-certifi
DEPENDS+=	${PYPKGPREFIX}-virtualenv-clone>=0.2.5:../../wip/py-virtualenv-clone
DEPENDS+=	${PYPKGPREFIX}-virtualenv>=0:../../devel/py-virtualenv
DEPENDS+=	# TODO: typing;python_version<"3.5">=0

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
