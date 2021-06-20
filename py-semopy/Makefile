# $NetBSD$

DISTNAME=	semopy-2.2.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/semopy/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://semopy.com
COMMENT=	Structural Equation Modeling Optimization in Python
LICENSE=	mit

DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-pandas>=0:../../math/py-pandas
DEPENDS+=	py-sympy>=0:../../math/py-sympy
DEPENDS+=	${PYPKGPREFIX}-scikit-learn>=0.22.1:../../math/py-scikit-learn
DEPENDS+=	py-statsmodels>=0:../../math/py-statsmodels

USE_LANGUAGES=	# none

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
