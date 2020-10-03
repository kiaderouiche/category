# $NetBSD$

DISTNAME=	storm-0.24
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	python # TODO: add primary category
MASTER_SITES=	https://files.pythonhosted.org/packages/23/1e/5376de4541fede4ceb0598b103f89a85a16f9fa7da06548cdf5455e340f2/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://storm.canonical.com
COMMENT=	Storm is an object-relational mapper (ORM) for Python developed at Canonical
LICENSE=	gnu-lgpl-v2

DEPENDS+=	${PYPKGPREFIX}-six>=1.15.1:../../lang/py-six
TEST_DEPENDS+=	${PYPKGPREFIX}-fixtures>=1.3.0:../../devel/py-fixtures
TEST_DEPENDS+=	pgbouncer>=0.0.7:../../databases/pgbouncer
TEST_DEPENDS+=	# TODO: postgresfixture>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-psycopg2>=2.3.0:../../databases/py-psycopg2
TEST_DEPENDS+=	${PYPKGPREFIX}-testresources>=0.2.4:../../devel/py-testresources
TEST_DEPENDS+=	${PYPKGPREFIX}-testtools>=0.9.8:../../devel/py-testtools
TEST_DEPENDS+=	# TODO: timeline>=0.0.2
TEST_DEPENDS+=	${PYPKGPREFIX}-transaction>=1.0.0:../../wip/py-transaction
TEST_DEPENDS+=	${PYPKGPREFIX}-twisted>=10.0.0:../../net/py-twisted
TEST_DEPENDS+=	# TODO: zope.component>=3.8.0
TEST_DEPENDS+=	# TODO: zope.configuration>=0
TEST_DEPENDS+=	# TODO: zope.interface>=4.0.0
TEST_DEPENDS+=	# TODO: zope.security>=3.7.2

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
