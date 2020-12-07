# $NetBSD$

DISTNAME=	swh.loader.pypi-0.0.9
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ba/1f/eb3fccc001ab581fe0edb3540a687a253051dbba7cb9f200cfb72eea1b91/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/source/swh-loader-pypi
COMMENT=	Software Heritage PyPI Loader
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	py-vcversioner>=0:../../devel/py-vcversioner
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-arrow>=0:../../time/py-arrow
DEPENDS+=	py-pkginfo>=0:../../devel/py-pkginfo
DEPENDS+=	# TODO: swh.core>=0
DEPENDS+=	# TODO: swh.model>=0.0.28
DEPENDS+=	# TODO: swh.storage>=0.0.114
DEPENDS+=	# TODO: swh.scheduler>=0.0.39
DEPENDS+=	# TODO: swh.loader.core>=0.0.37

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
