# $NetBSD$

DISTNAME=	kenv-0.1.9.31
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	https://files.pythonhosted.org/packages/a5/75/316ce14e86bd6ab681ab0f1e14c9a2484cfbda7f6e6822a2b45e6959acbc/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/fuodorov/kenv
COMMENT=	Solver of the Kapchinsky-Vladimirsky envelope equation
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE=	27

#DEPENDS+=	${PYPKGPREFIX}-scipy>=1.2.3:../../math/py-scipy

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
