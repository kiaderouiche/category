# $NetBSD$

DISTNAME=	symphysics-0.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/97/9e/21ac590f308a8b9f6a791e2b2c6ce7dc75e18450ed356a55ceedd46e1375/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/rjbourne/symphysics/
COMMENT=	The symphysics library for creating physics simulations using python and sympy
LICENSE=	mit

DEPENDS+=	py-sympy>=0:../../math/py-sympy
DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	# TODO: dill>=0
DEPENDS+=	py-matplotlib>=0:../../graphics/py-matplotlib

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
