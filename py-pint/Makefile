# $NetBSD$

DISTNAME=	Pint-0.17
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:tl}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=P/Pint/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/hgrecco/pint
COMMENT=	Physical quantities module
LICENSE=	modified-bsd

REPLACE_PYTHON+=	pint/pint-convert

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
