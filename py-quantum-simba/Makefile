# $NetBSD$

DISTNAME=	quantum-simba-0.9.6.dev0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/8a/2b/32ad04ebb23e7bafa963f0af1ada8486871376d767cca0f7c5a3c0d68a14/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/joebentley/simba
COMMENT=	Systematic realisation of quantum systems directly from transfer function
LICENSE=	mit

DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	py-sympy>=1.5.1:../../math/py-sympy
DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
