# $NetBSD$

DISTNAME=	lcapy-0.63
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/7b/20/2b7d183c17f0e5fcc9764bcfcdccef83b2c46b8ea7042e41fb1f631eb886/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/mph-/lcapy
COMMENT=	Symbolic linear circuit analysis
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	py-sympy>=0:../../math/py-sympy
DEPENDS+=	py-networkx>=0:../../math/py-networkx
DEPENDS+=	py-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	py-wheel>=0:../../devel/py-wheel

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
