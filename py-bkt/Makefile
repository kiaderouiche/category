# $NetBSD$

DISTNAME=	pyBKT-1.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pyBKT/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/CAHLR/pyBKT
COMMENT=	Python Implentation of Bayesian Knowledge Tracing
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE+=  36

DEPENDS+=	${PYPKGPREFIX}-requests>=2.25.1:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.25.3:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-scikit-learn>=0.22.1:../../math/py-scikit-learn

.include "../../math/py-numpy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
