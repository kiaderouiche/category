# $NetBSD$

DISTNAME=	mozlog-6.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/08/d8/396d951ca01222647569ef9064700a03ea99852c540a07e0828e25e200d0/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wiki.mozilla.org/Auto-tools/Projects/Mozbase
COMMENT=	Robust log handling specialized for logging in the Mozilla universe
#LICENSE=	Mozilla Public License 2.0 (MPL 2.0) # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-blessings>=1.3:../../devel/py-blessings
DEPENDS+=	# TODO: mozterm>=0
DEPENDS+=	py-six>=1.10.0:../../lang/py-six
TEST_DEPENDS+=	py-mozfile>=0:../../category/py-mozfile

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
