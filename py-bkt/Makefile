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

DEPENDS+=	${PYPKGPREFIX}-requests>=2.25.1:../../math/py-requests
DEPENDS+=	${PYPKGPREFIX}-tqdm>=4.49.0:../../misc/py-tqdm

.include "../../math/py-numpy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
