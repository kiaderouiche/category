# $NetBSD$

DISTNAME=	swh.loader.tar-0.0.41
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/21/ae/72e84e81bb76154878153fc88ceb36022c2806a4b50a2234479f5ed15f6d/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDTAR
COMMENT=	Software Heritage Tarball Loader
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-arrow>=0:../../time/py-arrow
DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: python-dateutil>=0
DEPENDS+=	# TODO: swh.core>=0.0.46
DEPENDS+=	# TODO: swh.model>=0.0.27
DEPENDS+=	# TODO: swh.scheduler>=0.0.39
DEPENDS+=	# TODO: swh.storage>=0.0.83
DEPENDS+=	# TODO: swh.loader.core>=0.0.35
DEPENDS+=	# TODO: swh.loader.dir>=0.0.33

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
