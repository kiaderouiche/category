# $NetBSD$

DISTNAME=	c-lasso-1.0.0.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/6f/04/3602ac08b185d40054c6d7616ef07459414578c4600d4ffa6415d8c951d0/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/Leo-Simpson/CLasso
COMMENT=	Algorithms for constrained Lasso problems
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-h5py>=0:../../devel/py-h5py
DEPENDS+=	${PYPKGPREFIX}-scipy>=0:../../math/py-scipy

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
