# $NetBSD$

DISTNAME=	swh.scheduler-0.8.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/1f/62/7af2a5869646b276b75164304677934495b8b440a12b9adcca407138066c/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DSCH/
COMMENT=	Software Heritage Scheduler
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-attrs>=0:../../devel/py-attrs
DEPENDS+=	# TODO: attrs-strict>=0
DEPENDS+=	py-celery>=4.3,!=5.0.3:../../net/py-celery
DEPENDS+=	# TODO: Click>=0
DEPENDS+=	py-elasticsearch>5.4:../../databases/py-elasticsearch
DEPENDS+=	py-flask>=0:../../www/py-flask
DEPENDS+=	py-humanize>=0:../../textproc/py-humanize
DEPENDS+=	py-pika>=1.1.0:../../net/py-pika
DEPENDS+=	py-psycopg2>=0:../../databases/py-psycopg2
DEPENDS+=	# TODO: pyyaml>=0
DEPENDS+=	py-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	py-typing-extensions>=0:../../devel/py-typing-extensions
DEPENDS+=	# TODO: swh.core[db,http]>=0.5
DEPENDS+=	# TODO: swh.storage>=0.11.1

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
