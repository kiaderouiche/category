# $NetBSD$

DISTNAME=	datashape-0.5.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/datashape/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://files.pythonhosted.org/packages/a6/5b/95b2ed56b61e649b69c9a5b1ecb32ff0a5cd68b9f69f5aa7774540e6b444/
COMMENT=	Data description language
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-multipledispatch>=0.6.0:../../devel/py-multipledispatch

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.7
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
