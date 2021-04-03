# $NetBSD$

DISTNAME=	sdm-1.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT=	PySDM
GITHUB_TAG=	refs/tags/v1.2
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_GITHUB:=atmos-cloud-sim-uj/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/atmos-cloud-sim-uj/PySDM
COMMENT=	Pythonic particle-based (super-droplet) cloud microphysics modelling with Jupyter examples
#LICENSE=	GPL-3.0 # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	py-setuptools_scm>=0:../../devel/py-setuptools_scm
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-numba>=0:../../math/py-numba
DEPENDS+=	py-pint>=0:../../wip/py-pint
DEPENDS+=	# TODO: molmass>=0
DEPENDS+=	# TODO: scipy>=0

WRKSRC=		${WRKDIR}/PySDM-1.2
USE_LANGUAGES=	# none

# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
