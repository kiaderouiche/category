# $NetBSD$

DISTNAME=	mozfile-2.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ab/64/60b282b167a923aa8f3bdc819816592a55260dd71d72c45cc6a49fc67798/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wiki.mozilla.org/Auto-tools/Projects/Mozbase
COMMENT=	Library of file utilities for use in Mozilla testing
#LICENSE=	MPL # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-six>=1.10.0:../../lang/py-six
TEST_DEPENDS+=	# TODO: wptserve>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
