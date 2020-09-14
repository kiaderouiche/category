# $NetBSD$

DISTNAME=	cocos-0.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/b3/d0/491df91a15238bdfe7bd4bc21f86e31992d4db3213be70ae4a11e3ddeb29/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/michaelnowotny/cocos
COMMENT=	Core Computational System
LICENSE=	mit

DEPENDS+=       ${PYPKGPREFIX}-cached-property>=1.5.1:../../devel/py-cached-property
DEPENDS+=       ${PYPKGPREFIX}-test>=1.5.1:../../devel/py-test
DEPENDS+=	${PYPKGPREFIX}-scipy>=1.4.1:../../math/py-scipy
DEPENDS+=       ${PYPKGPREFIX}-sympy>=1.5.1:../../math/py-sympy
DEPENDS+=       ${PYPKGPREFIX}-arrayfire>=1.5.1:../../wip/py-arrayfire
DEPENDS+=       ${PYPKGPREFIX}-contexttimer>=1.5.1:../../wip/py-contexttimer
DEPENDS+=       ${PYPKGPREFIX}-loky>=2.8.0:../../wip/py-loky
DEPENDS+=       ${PYPKGPREFIX}-pathos>=0.2.6:../../wip/py-pathos

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
