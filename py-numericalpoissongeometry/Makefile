# $NetBSD$

DISTNAME=	numericalpoissongeometry-0.0.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ac/21/5ab967783f110bfe4b8f645f96b58f5c108158c3036c3950e2e3cf3343cb/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/appliedgeometry/NumericalPoissonGeometry
COMMENT=	A Python Numeric module for (local) calculus on Poisson manifolds
LICENSE=	mit

DEPENDS+=	py-sympy>=0:../../math/py-sympy
DEPENDS+=	# TODO: torch>=0
DEPENDS+=	# TODO: tensorflow>=0
DEPENDS+=	# TODO: poissongeometry>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
