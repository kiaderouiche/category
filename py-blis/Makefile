# $NetBSD$

DISTNAME=	blis-0.7.4
PKGNAME=        ${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_PYPI:=b/blis/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/explosion/cython-blis
COMMENT=	BLAS-like linear algebra library, as a self-contained C-extension
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-hypothesis4>=4.0.0:../../devel/py-hypothesis4

.include "../../devel/py-cython/buildlink3.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
