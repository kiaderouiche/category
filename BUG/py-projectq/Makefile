# $NetBSD$

DISTNAME=	projectq-0.5.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/e1/5d/d470b8f15f933587efbc38d4202662bae69eccfa69e2b82c2c420afd44fa/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://projectq.ch/
COMMENT=	Open source software framework for quantum computing
LICENSE=	apache-2.0

USE_LANGUAGES=	c c++

DEPENDS+=	${PYPKGPREFIX}-future>=0.18.2:../../devel/py-future
DEPENDS+=	${PYPKGPREFIX}-requests>=2.24.0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-pybind11>=2.5.0:../../devel/py-pybind11
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=3.2.2:../../graphics/py-matplotlib
DEPENDS+=	${PYPKGPREFIX}-networkx>=1.4.1:../../math/py-networkx
#DEPENDS+=	${PYPKGPREFIX}-scipy>=1.4.1:../../math/py-scipy
TEST_DEPENDS+=	${PYPKGPREFIX}-test-[0-9]*:../../devel/py-test

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
