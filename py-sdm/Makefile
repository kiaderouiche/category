# $NetBSD$

DISTNAME=	sdm-1.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT=	PySDM
GITHUB_TAG=	refs/tags/v1.2
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_GITHUB:=atmos-cloud-sim-uj/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/atmos-cloud-sim-uj/PySDM
COMMENT=	Pythonic particle-based cloud microphysics modelling
LICENSE=	gnu-gpl-v3

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	${PYPKGPREFIX}-numba>=0:../../math/py-numba
DEPENDS+=	${PYPKGPREFIX}-pint>=0:../../wip/py-pint
DEPENDS+=	${PYPKGPREFIX}-molmass-[0-9]*:../../wip/py-molmass
DEPENDS+=	# TODO: scipy>=0

WRKSRC=		${WRKDIR}/PySDM-1.2

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
