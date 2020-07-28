# $NetBSD$

DISTNAME=	docker-services-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/46/0c/c02cb976fd68fd4b26f1562b094cf18a3c883beff910e5733b76f33b7b21/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/dmonroy/docker-services
COMMENT=	Uses docker to spawn containers for services required during tests
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-setuptools_scm>=0:../../devel/py-setuptools_scm
DEPENDS+=	py-docker>=0:../../category/py-docker
DEPENDS+=	# TODO: pytest>=0
DEPENDS+=	# TODO: pyyaml>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
