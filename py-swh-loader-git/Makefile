# $NetBSD$

DISTNAME=	swh.loader.git-0.5.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/dc/fd/06c3fbee43d5aebe2a804ba0252fba18a854850fac2a88d71ab0de11e7ef/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDG/
COMMENT=	Software Heritage git loader
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-dulwich>=0.18.7:../../devel/py-dulwich
DEPENDS+=	py-retrying>=0:../../wip/py-retrying
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: swh.core>=0.0.7
DEPENDS+=	# TODO: swh.loader.core>=v0.11.0
DEPENDS+=	# TODO: swh.model>=0.4.0
DEPENDS+=	# TODO: swh.scheduler>=0.0.39
DEPENDS+=	# TODO: swh.storage>=0.12.0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
