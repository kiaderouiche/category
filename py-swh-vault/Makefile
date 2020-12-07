# $NetBSD$

DISTNAME=	swh.vault-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/d9/c6/cf0d06cbdf56f996f11f0bf275a767ea05ae756a7b97fb130059bf8b14eb/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DVAU/
COMMENT=	Software Heritage vault
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-flask>=0:../../www/py-flask
DEPENDS+=	py-psycopg2>=0:../../databases/py-psycopg2
DEPENDS+=	# TODO: python-dateutil>=0
DEPENDS+=	py-fastimport>=0:../../devel/py-fastimport
DEPENDS+=	py-typing-extensions>=0:../../devel/py-typing-extensions
DEPENDS+=	# TODO: swh.core[db,http]>=0.5
DEPENDS+=	# TODO: swh.model>=0.3
DEPENDS+=	# TODO: swh.objstorage>=0.0.17
DEPENDS+=	# TODO: swh.scheduler>=0.7.0
DEPENDS+=	# TODO: swh.storage>=0.0.106

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
