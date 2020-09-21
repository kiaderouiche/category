# $NetBSD$

DISTNAME=	pycvodes-0.13.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/da/52/99456ff813a22d90e46c2fd2c543cea7ab00e151d4292c6896b7f1a62e57/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/bjodah/pycvodes
COMMENT=	Python binding for cvodes from the sundials library
LICENSE=	2-clause-bsd

DEPENDS+=	${PYPKGPREFIX}-psutil>=5.7.2:../../devel/py-psutil

.include "../../devel/py-cython/buildlink3.mk"
BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
