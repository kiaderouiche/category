# $NetBSD$

DISTNAME=	pySpecData-0.9.5.3.1
PKGNAME=	${PYPKGPREFIX}-specData-0.9.5.3.1
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/e2/2e/86411e6d086caea73d050c7ead529d73555b65153d194e2092fd1197c8df/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://github.com/jmfranck/pyspecdata
COMMENT=	Object-oriented N-dimensional data processing
#LICENSE=	# TODO: (see mk/license.mk)

USE_LANGUGES=	c c++

TEST_DEPENDS+=	${PYPKGPREFIX}-test-[0-9]*:../../devel/py-test

DEPENDS+=       ${PYPKGPREFIX}-h5py>=2.9.0:../../devel/py-h5py
DEPENDS+=       ${PYPKGPREFIX}-matplotlib>=3.2.2:../../graphics/py-matplotlib
DEPENDS+=       ${PYPKGPREFIX}-Pillow>=6.2.2:../../graphics/py-Pillow
DEPENDS+=       ${PYPKGPREFIX}-scipy>=1.4.1:../../math/py-scipy
DEPENDS+=       ${PYPKGPREFIX}-sympy>=1.5.1:../../math/py-sympy


.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
