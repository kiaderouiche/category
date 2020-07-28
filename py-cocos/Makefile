# $NetBSD$

DISTNAME=	cocos-0.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b3/d0/491df91a15238bdfe7bd4bc21f86e31992d4db3213be70ae4a11e3ddeb29/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/michaelnowotny/cocos
COMMENT=	Core Computational System
LICENSE=	mit

DEPENDS+=	# TODO: arrayfire>=0
DEPENDS+=	# TODO: cached_property>=0
DEPENDS+=	# TODO: contexttimer>=0
DEPENDS+=	# TODO: loky>=0
DEPENDS+=	# TODO: pathos>=0
DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	py-sympy>=0:../../math/py-sympy
DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
