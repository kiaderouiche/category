# $NetBSD$

DISTNAME=	lazr.restfulclient-0.14.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/4a/2f/14812d3b0808c594c1e090505229d5ae31d55eb93c23417d91b3a1f57853/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://launchpad.net/lazr.restfulclient
COMMENT=	Programmable client library that takes advantage
#LICENSE=	LGPL v3 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-distro>=0:../../devel/py-distro
DEPENDS+=	${PYPKGPREFIX}-httplib2>=0.6.0:../../www/py-httplib2
DEPENDS+=	${PYPKGPREFIX}-oauthlib>=0:../../security/py-oauthlib
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-wadllib>=1.1.4:../../wip/py-wadllib
TEST_DEPENDS+=	${PYPKGPREFIX}-fixtures>=1.3.0:../../devel/py-fixtures
TEST_DEPENDS+=	# TODO: lazr.authentication>=0
TEST_DEPENDS+=	# TODO: lazr.restful>=0.11.0
TEST_DEPENDS+=	# TODO: mock;python_version<"3">=0
TEST_DEPENDS+=	# TODO: wsgi_intercept>=0
TEST_DEPENDS+=	# TODO: zope.testrunner>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
