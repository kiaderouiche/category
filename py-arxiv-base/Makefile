# $NetBSD$

DISTNAME=	arxiv-base-0.16.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/d2/22/94b35de6cc93d5f7986496aeab60360cedde664e202b1cf4fa365cb51511/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://files.pythonhosted.org/packages/d2/22/94b35de6cc93d5f7986496aeab60360cedde664e202b1cf4fa365cb51511/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-flask>=0:../../www/py-flask
DEPENDS+=	py-jsonschema>=0:../../textproc/py-jsonschema
DEPENDS+=	py-pytz>=0:../../time/py-pytz
DEPENDS+=	py-uwsgi>=0:../../www/py-uwsgi
DEPENDS+=	py-boto3>=0:../../net/py-boto3
DEPENDS+=	# TODO: bleach==3.1.0>=0
DEPENDS+=	# TODO: backports-datetime-fromisoformat==1.0.0>=0
DEPENDS+=	py-typing-extensions>=0:../../devel/py-typing-extensions

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
