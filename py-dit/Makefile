# $NetBSD$

DISTNAME=	dit-1.2.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/dit/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://dit.io/
COMMENT=	Python package for information theory
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-scipy>=1.6.3:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-six>=1.4.0:../../lang/py-six

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
