# $NetBSD$

DISTNAME=	TraceInv-0.0.23
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/T/t//}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_PYPI:=T/TraceInv/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://ameli.github.io/TraceInv
COMMENT=	Computes the trace of the inverse of matrix or linear matrix function
LICENSE=	mit


.include "../../devel/py-cython/buildlink3.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
