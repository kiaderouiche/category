# $NetBSD$

DISTNAME=	hiphive-0.7.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/4b/de/5c91cb7c24167456f0284e91c8f98a8d21cc0bb5d4a747ceb19708be3559/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://hiphive.materialsmodeling.org/
COMMENT=	High-order force constants for the masses
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: ase>=0
DEPENDS+=	py-h5py>=0:../../devel/py-h5py
DEPENDS+=	py-numba>=0:../../math/py-numba
DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	py-scikit-learn>=0:../../math/py-scikit-learn
DEPENDS+=	# TODO: spglib>=0
DEPENDS+=	py-sympy>=1.1:../../math/py-sympy

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.12
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
