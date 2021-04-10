# $NetBSD$

DISTNAME=	faiss-cpu-1.7.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=f/faiss-cpu/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/kyamagu/faiss-wheels
COMMENT=	Efficient similarity search and clustering of dense vectors
LICENSE=	mit

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix+=	setup.py
SUBST_STAGE.prefix=	pre-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/local/include,${PREFIX}/include,g'
SUBST_MESSAGE.paths=	Fixing header search paths.

BUILDLINK_API_DEPENDS.py-numpy+=        ${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
