# $NetBSD$

DISTNAME=	mozprofile-2.5.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/0b/39/39c8237a511a26effc53020b801e452a04cf52c2c9d9b71dcc21262903ef/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wiki.mozilla.org/Auto-tools/Projects/Mozbase
COMMENT=	Library to create and modify Mozilla application profiles
#LICENSE=	MPL 2.0 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-mozfile>=1.2:../../category/py-mozfile
DEPENDS+=	py-mozlog>=6.0:../../category/py-mozlog
DEPENDS+=	py-six>=1.10.0,<2:../../lang/py-six
TEST_DEPENDS+=	# TODO: wptserve>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
