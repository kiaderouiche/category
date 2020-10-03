# $NetBSD$

DISTNAME=	postgresfixture-0.4.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/d9/23/9c687e856c9d378580e93fe13b57ff7222fcb92ab98592cf8fbe378a36a9/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://files.pythonhosted.org/packages/d9/23/9c687e856c9d378580e93fe13b57ff7222fcb92ab98592cf8fbe378a36a9/
COMMENT=	A fixture for creating PostgreSQL clusters and databases, and tearing them down again, intended for use during development and testing
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-fixtures>=0.3.8:../../devel/py-fixtures
DEPENDS+=	py-psycopg2>=2.4.4:../../databases/py-psycopg2
DEPENDS+=	py-testtools>=0.9.14:../../devel/py-testtools
DEPENDS+=	py-testscenarios>=0.4:../../devel/py-testscenarios
TEST_DEPENDS+=	py-testtools>=0.9.14:../../devel/py-testtools

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
