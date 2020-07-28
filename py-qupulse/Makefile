# $NetBSD$

DISTNAME=	qupulse-0.5.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f7/73/6becb468cb8b430967396b938ea2c8584507558909913ad0b9800529eac3/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/qutech/qupulse
COMMENT=	A Quantum compUting PULse parametrization and SEquencing framework
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-sympy>=1.1.1:../../math/py-sympy
DEPENDS+=	# TODO: cached_property>=0
DEPENDS+=	# TODO: more_itertools>=0
TEST_DEPENDS+=	# TODO: pytest_benchmark>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
