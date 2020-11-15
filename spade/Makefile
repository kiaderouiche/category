# $NetBSD$

DISTNAME=	spade-3.1.6
CATEGORIES=	devel net python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/spade/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/javipalanca/spade
COMMENT=	Smart Python Agent Development Environment
LICENSE=	mit

BUILD_DEPENDS+=	${PYPKGPREFIX}-test-runner>=5.2:../../devel/py-test-runner
DEPENDS+=	${PYPKGPREFIX}-multidict>=5.0.0:../../databases/py-multidict
DEPENDS+=	${PYPKGPREFIX}-asn1-modules>=0.2.8:../../security/py-asn1-modules
DEPENDS+=	${PYPKGPREFIX}-asn1>=0.4.7:../../security/py-asn1
DEPENDS+=	${PYPKGPREFIX}-aioxmpp>=0.10:../../wip/py-aioxmpp
DEPENDS+=	${PYPKGPREFIX}-aiohttp>=3.5.4:../../www/py-aiohttp
DEPENDS+=	${PYPKGPREFIX}-aiohttp-jinja2>=0.14.0:../../wip/py-aiohttp-jinja2
DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.9.6:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-jinja2-time>=0.2.0:../../time/py-jinja2-time
DEPENDS+=	${PYPKGPREFIX}-timeago>=1.0.8:../../wip/py-timeago
DEPENDS+=	${PYPKGPREFIX}-singletonify>=0.2.3:../../wip/py-singletonify
TEST_DEPENDS+=	${PYPKGPREFIX}-pip>=1.0.0:../../devel/py-pip
TEST_DEPENDS+=	${PYPKGPREFIX}-bumpversion>=0.5.3:../../devel/py-bumpversion
TEST_DEPENDS+=	${PYPKGPREFIX}-wheel>=0.29.0:../../devel/py-wheel
TEST_DEPENDS+=	${PYPKGPREFIX}-watchdog>=0.8.3:../../devel/py-watchdog
TEST_DEPENDS+=	${PYPKGPREFIX}-pyflakes>=1.6.0:../../devel/py-pyflakes
TEST_DEPENDS+=	${PYPKGPREFIX}-tox>2.3.1:../../devel/py-tox
TEST_DEPENDS+=	${PYPKGPREFIX}-coverage>=4.0.3:../../devel/py-coverage
TEST_DEPENDS+=	${PYPKGPREFIX}-sphinx>=1.4.8:../../textproc/py-sphinx
TEST_DEPENDS+=	${PYPKGPREFIX}-yaml-[0-9]*:../../textproc/py-yaml
#TEST_DEPENDS+=	# TODO: asynctest==0.13.0>=0
#TEST_DEPENDS+=	# TODO: pytest-asyncio==0.8.0>=0
#TEST_DEPENDS+=	# TODO: pytest-cov==2.5.1>=0
TEST_DEPENDS+=	# TODO: pytest-mock==1.10.0>=0
TEST_DEPENDS+=	# TODO: pluggy<0.7,>=0.5
TEST_DEPENDS+=	# TODO: python-coveralls==2.9.1>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-requests>=2.20.0:../../devel/py-requests
TEST_DEPENDS+=	${PYPKGPREFIX}-parsel-1.6.0:../../www/py-parsel
TEST_DEPENDS+=	${PYPKGPREFIX}-sphinx-rtd-theme>=0.4.0:../../textproc/py-sphinx-rtd-theme
TEST_DEPENDS+=	${PYPKGPREFIX}-docutils>=2.20.0:../../devel/py-docutils
TEST_DEPENDS+=	${PYPKGPREFIX}-requests>=2.20.0:../../devel/py-requests
TEST_DEPENDS+=	${PYPKGPREFIX}-factory-boy>=2.12.0:../../wip/py-factory-boy
TEST_DEPENDS+=	${PYPKGPREFIX}-testfixtures>=6.3.00:../../wip/py-testfixtures

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
