# $NetBSD$

DISTNAME=	spherical-functions-2020.8.18.15.37.20
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/09/9e/1878ff62a3728ca04734ca610150a872a9f55db3c888b592e98761c96755/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/moble/spherical_functions
COMMENT=	Implementation of Wigner D Matrices, spin-weighted spherical harmonics
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: numpy-quaternion>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.13
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
