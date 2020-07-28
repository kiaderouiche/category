# $NetBSD$

DISTNAME=	ptyx-20.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/c0/21/5cc7d642f2972c53978c9217cef1edbdfeec004a054fc9731fcab0fe370c/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/wxgeo/ptyx
COMMENT=	pTyX is a python precompiler for LaTeX
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-sympy>=0:../../math/py-sympy
DEPENDS+=	py-Pillow>=0:../../graphics/py-Pillow

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
