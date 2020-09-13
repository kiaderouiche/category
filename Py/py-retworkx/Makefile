# $NetBSD$

DISTNAME=	retworkx-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math graphics
MASTER_SITES=	https://files.pythonhosted.org/packages/69/84/a1e7b2dd17b847d0b6dd462cb111bb0f025f1bccd49fc661f89a0767b8bf/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/Qiskit/retworkx
COMMENT=	Python graph library implemented in Rust
LICENSE=	apache-2.0

DEPENDS+=	${PYPKGPREFIX}-setuptools-rust>=0.10.6:../../devel/py-setuptools-rust

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
