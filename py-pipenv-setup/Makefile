# $NetBSD$

DISTNAME=	pipenv-setup-3.1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pipenv-setup/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/Madoshakalaka/pipenv-setup
COMMENT=	sync Pipfile/Pipfile.lock to setup.py
LICENSE=	mit

BUILD_DEPENDS+=	${PYPKGPREFIX}-test>=5.3.10:../../devel/py-test
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-mypy~=0.3;python_version>='3.5'
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-cov~=2.7>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-datadir~=1.3>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-xdist~=1.29>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-tox~=3.14>=0
#DEPENDS+=	${PYPKGPREFIX}-pipfile>=0.0.2:../../devel/py-pipfile
DEPENDS+=	${PYPKGPREFIX}-black==19.10b0;python_version>='3.6'
DEPENDS+=	${PYPKGPREFIX}-colorama>=0.4.3:../../comms/py-colorama
DEPENDS+=	${PYPKGPREFIX}-packaging>=19.2:../../devel/py-packaging
DEPENDS+=	${PYPKGPREFIX}-requirementslib>=1.5.15:../../wip/py-requirementslib
DEPENDS+=	${PYPKGPREFIX}-vistir>=0.4:../../wip/py-vistir
DEPENDS+=	${PYPKGPREFIX}-autopep8>=1.5.4:../../devel/py-autopep8
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	# TODO: typing~=3.7;python_version<'3.7'>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
