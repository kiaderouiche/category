# $NetBSD$

DISTNAME=	swh.objstorage-0.2.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/0a/18/3f765ad1bc4ebed4e0660a308705bee50c9cdfeadaa32cfdaa3fd4f9d83d/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DOBJS
COMMENT=	Software Heritage Object Storage
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-aiohttp>=3:../../www/py-aiohttp
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: swh.core[http]>=0.3
DEPENDS+=	# TODO: swh.model>=0.0.27

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
