# $NetBSD$

DISTNAME=	symengine-0.6.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	https://files.pythonhosted.org/packages/c7/21/1b6af2da049e41b7c91eec00f7fbbb9f0099eae9440f20b4be3cd5b41373/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/symengine/symengine.py
COMMENT=	Python library providing wrappers to SymEngine
LICENSE=	mit

USE_LANGUGES=	c c++

.include "../../devel/py-cython/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
