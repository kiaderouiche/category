# $NetBSD$

DISTNAME=	gotran-2020.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/94/c9/2c28199cadebb1bd4b104b4b09b4c73067be124e6b31703eefeb1f0b19b1/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ComputationalPhysiology/gotran
COMMENT=	A declarative language describing ordinary differential equations
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: sympy<=1.1.1>=0
DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	py-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	py-networkx>=0:../../math/py-networkx
DEPENDS+=	py-six>=0:../../lang/py-six
DEPENDS+=	py-future>=0:../../devel/py-future
DEPENDS+=	# TODO: modelparameters>=0
DEPENDS+=	# TODO: instant>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
