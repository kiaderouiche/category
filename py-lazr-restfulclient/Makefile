# $NetBSD$

DISTNAME=	lazr.restfulclient-0.14.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/4a/2f/14812d3b0808c594c1e090505229d5ae31d55eb93c23417d91b3a1f57853/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://launchpad.net/lazr.restfulclient
COMMENT=	A programmable client library that takes advantage of the commonalities among
#LICENSE=	LGPL v3 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-distro>=0:../../devel/py-distro
DEPENDS+=	# TODO: httplib2;python_version<"3">=0
DEPENDS+=	py-httplib2>=0.7.7;python_version>="3":../../www/py-httplib2
DEPENDS+=	py-oauthlib>=0:../../security/py-oauthlib
DEPENDS+=	py-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	py-six>=0:../../lang/py-six
DEPENDS+=	py-wadllib>=1.1.4:../../wip/py-wadllib
TEST_DEPENDS+=	py-fixtures>=1.3.0:../../devel/py-fixtures
TEST_DEPENDS+=	# TODO: lazr.authentication>=0
TEST_DEPENDS+=	# TODO: lazr.restful>=0.11.0
TEST_DEPENDS+=	# TODO: mock;python_version<"3">=0
TEST_DEPENDS+=	# TODO: oauth>=0
TEST_DEPENDS+=	py-testtools>=0:../../devel/py-testtools
TEST_DEPENDS+=	# TODO: wsgi_intercept>=0
TEST_DEPENDS+=	# TODO: zope.testrunner>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
