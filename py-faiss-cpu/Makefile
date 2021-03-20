# $NetBSD$

DISTNAME=	faiss-cpu-1.7.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=f/faiss-cpu/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/kyamagu/faiss-wheels
COMMENT=	Library for efficient similarity search and clustering of dense vectors
LICENSE=	mit

BUILDLINK_API_DEPENDS.py-numpy+=        ${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
