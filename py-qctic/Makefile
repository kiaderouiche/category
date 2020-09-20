# $NetBSD$

DISTNAME=	qctic-0.12.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ff/f2/503d303daa4cfae751aee31c10ff8b832cf0d713e9ae5372f51d84711389/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://bitbucket.org/fundacionctic/erwin-qiskit
COMMENT=	Qiskit provider to interact with the QCTIC quantum simulator platform
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-autopep8>=1.5,<2.0:../../devel/py-autopep8
BUILD_DEPENDS+=	${PYPKGPREFIX}-pylint>=2.0,<3.0:../../devel/py-pylint
BUILD_DEPENDS+=	${PYPKGPREFIX}-rope>=0.16.0,<1.0:../../devel/py-rope
BUILD_DEPENDS+=	# TODO: pytest>=5.0,<6.0
BUILD_DEPENDS+=	# TODO: bumpversion>=0.5.3,<1.0
BUILD_DEPENDS+=	# TODO: pytest-httpserver>=0.3.0,<1.0
BUILD_DEPENDS+=	# TODO: coloredlogs>=14.0,<15.0
BUILD_DEPENDS+=	# TODO: pytest-cov>=2.8.1,<3.0
BUILD_DEPENDS+=	# TODO: pytest-asyncio>=0.10.0,<1.0
BUILD_DEPENDS+=	py-notebook>=6.0,<7.0:../../www/py-notebook
BUILD_DEPENDS+=	# TODO: coloredlogs>=14.0,<15.0
DEPENDS+=	#${PYPKGPREFIX}-qiskit-aer>=0.4.0,<1.0.0
DEPENDS+=	${PYPKGPREFIX}-marshmallow>=3.0,<4.0:../../wip/py-marshmallow
DEPENDS+=	${PYPKGPREFIX}-tornado>=6.0,<7.0:../../www/py-tornado

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
