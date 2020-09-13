# $NetBSD$

DISTNAME=	notifiers-1.2.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	sysutils python
MASTER_SITES=	https://files.pythonhosted.org/packages/4f/36/4c300f55949b9be84284d51253ae48d564dc2c4f2bffb94f26c8c1485f07/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/notifiers/notifiers
COMMENT=	The easy way to send notifications
LICENSE=	mit

BUILD_DEPENDS+=	${PYPKGPREFIX}-alabaster==0.7.11#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-aspy.yaml==1.1.1#viapre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-atomicwrites==1.1.5#viapytest>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-attrs==18.1.0#viahypothesis,pytest>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-babel==2.6.0#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-bumpversion==0.5.3>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-certifi==2018.4.16#viarequests>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-cfgv==2.0.0#viapre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-chardet==3.0.4#viarequests>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-click==6.7#viapip-tools>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-codecov==2.0.15>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage==4.5.1#viacodecov,pytest-cov>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-docutils==0.14#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-hypothesis==4.32.3>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-identify==1.1.4#viapre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-idna==2.7#viarequests>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-imagesize==1.0.0#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-importlib-metadata==0.18#viapluggy,pre-commit,pytest>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-jinja2==2.10.1#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-markupsafe==1.0#viajinja2>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-more-itertools==4.2.0#viapytest>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-nodeenv==1.3.2#viapre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-packaging==17.1#viapytest,sphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pip-tools==4.0.0>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pluggy==0.12.0#viapytest>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pre-commit==1.18.2>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-py==1.5.4#viapytest>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pygments==2.2.0#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pyparsing==2.2.0#viapackaging>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pytest-cov==2.7.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pytest==5.0.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pytz==2018.5#viababel>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pyyaml==5.1#viaaspy.yaml,pre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-requests==2.22.0#viacodecov,sphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-six==1.11.0#viacfgv,more-itertools,packaging,pip-tools,pre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-snowballstemmer==1.2.1#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx-autodoc-annotation==1.0.post1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx-rtd-theme==0.4.3>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx==2.2.0>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-applehelp==1.0.1#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-devhelp==1.0.1#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-htmlhelp==1.0.2#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-jsmath==1.0.1#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-qthelp==1.0.2#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-serializinghtml==1.1.3#viasphinx>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-toml==0.9.4#viapre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-urllib3==1.24.2#viarequests>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-virtualenv==16.0.0#viapre-commit>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-wcwidth==0.1.7#viapytest>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-zipp==0.5.1#viaimportlib-metadata>=0
DEPENDS+=	${PYPKGPREFIX}-requests>=2.21.0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-jsonschema>=3.0.0:../../textproc/py-jsonschema
DEPENDS+=	${PYPKGPREFIX}-click>=7.0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-rfc3987>=1.3.8
TEST_DEPENDS+=	${PYPKGPREFIX}-pytest>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
