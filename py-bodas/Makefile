# $NetBSD$

DISTNAME=	bodas-0.0.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/8b/52/a323897b57aa29c91f6a7df1c044a59a877fd7af308b6ac9dcb1a66b7fc7/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/urbanij/bodas
COMMENT=	Asymptotic Bode Plot in Python
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-matplotlib>=3.3.3,<4.0.0:../../graphics/py-matplotlib
DEPENDS+=	py-sympy>=1.7.1,<2.0.0:../../math/py-sympy

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.19.5,<2.0.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
