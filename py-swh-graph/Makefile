# $NetBSD$

DISTNAME=	swh.graph-0.2.9
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/1c/1f/fc0cb7be3115cba118f25ed282633fdd8d66955dd5e9f85854ea2a71d737/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DGRPH
COMMENT=	Software Heritage graph service
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-aiohttp>=0:../../www/py-aiohttp
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-py4j>=0:../../wip/py-py4j
DEPENDS+=	py-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	# TODO: swh.core[http]>=0.0.79
DEPENDS+=	# TODO: swh.model>=0
TEST_DEPENDS+=	# TODO: pytest>=0

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
