# $NetBSD$

DISTNAME=	checkov-1.0.665
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/checkov/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/bridgecrewio/checkov
COMMENT=	Infrastructure as code static analysis
LICENSE=	apache-2.0

PYTHON_VERSIONS_ACCEPTED=	39 38 37

BUILD_DEPENDS+=	${PYPKGPREFIX}-zipp>=0.6.0:../../archivers/py-zipp
BUILD_DEPENDS+=	${PYPKGPREFIX}-alabaster-[0-9]*:../../textproc/py-alabaster
BUILD_DEPENDS+=	${PYPKGPREFIX}-attrs>=19.3.0:../../devel/py-attrs
BUILD_DEPENDS+=	${PYPKGPREFIX}-babel>=2.7.0:../../devel/py-babel
BUILD_DEPENDS+=	${PYPKGPREFIX}-certifi-[0-9]*:../../security/py-certifi
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage>=4.5.4:../../devel/py-coverage
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage-badge>=1.0.1:../../wip/py-coverage-badge
BUILD_DEPENDS+=	${PYPKGPREFIX}-docutils>=0.15.2:../../textproc/py-docutils
BUILD_DEPENDS+=	${PYPKGPREFIX}-imagesize>=1.1.0:../../graphics/py-imagesize
BUILD_DEPENDS+=	${PYPKGPREFIX}-importlib-metadata>=2.0.0:../../devel/py-importlib-metadata
BUILD_DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.10.3:../../textproc/py-jinja2
#BUILD_DEPENDS+=	${PYPKGPREFIX}-lark-parser>=0.7.8:../../wip/py-lark-parser
BUILD_DEPENDS+=	${PYPKGPREFIX}-markupsafe>=1.1.1:../../textproc/py-markupsafe
BUILD_DEPENDS+=	${PYPKGPREFIX}-more-itertools>=8.0.0:../../devel/py-more-itertools
BUILD_DEPENDS+=	${PYPKGPREFIX}-packaging>=19.2:../../devel/py-packaging
BUILD_DEPENDS+=	${PYPKGPREFIX}-pluggy>=0.13.1:../../devel/py-pluggy
BUILD_DEPENDS+=	${PYPKGPREFIX}-py>=1.8.0:../../devel/py-py
BUILD_DEPENDS+=	${PYPKGPREFIX}-pygments>=2.5.2:../../textproc/py-pygments
BUILD_DEPENDS+=	${PYPKGPREFIX}-pyparsing>=2.4.5:../../devel/py-pyparsing
BUILD_DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test
BUILD_DEPENDS+=	${PYPKGPREFIX}-pytz-[0-9]*:../../time/py-pytz
BUILD_DEPENDS+=	${PYPKGPREFIX}-snowballstemmer>=2.0.0:../../textproc/py-snowballstemmer
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx>=2.2.1:../../textproc/py-sphinx
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-applehelp>=1.0.1:../../textproc/py-sphinxcontrib-applehelp
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-devhelp>=1.0.1:../../textproc/py-sphinxcontrib-devhelp
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-htmlhelp>=1.0.2:../../textproc/py-sphinxcontrib-htmlhelp
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-jsmath>=1.0.1:../../textproc/py-sphinxcontrib-jsmath
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-qthelp>=1.0.2:../../textproc/py-sphinxcontrib-qthelp
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-serializinghtml>=:../../textproc/py-sphinxcontrib-serializinghtml
BUILD_DEPENDS+=	${PYPKGPREFIX}-wcwidth>=0.1.7:../../devel/py-wcwidth
DEPENDS+=	${PYPKGPREFIX}-update-checker-[0-9]*:../../wip/py-update-checker
DEPENDS+=	${PYPKGPREFIX}-tqdm>=4.49.0:../../misc/py-tqdm
DEPENDS+=	${PYPKGPREFIX}-boto3>=1.12.43:../../net/py-boto3
DEPENDS+=	${PYPKGPREFIX}-chardet>=3.0.4:../../converters/py-chardet
DEPENDS+=	${PYPKGPREFIX}-colorama>=0.4.3:../../comms/py-colorama
DEPENDS+=	${PYPKGPREFIX}-docopt>=0.6.2:../../devel/py-docopt
DEPENDS+=	${PYPKGPREFIX}-idna>=2.8:../../www/py-idna
DEPENDS+=	${PYPKGPREFIX}-jmespath>=0.10.0:../../textproc/py-jmespath
#DEPENDS+=	${PYPKGPREFIX}-lark-parser>=0.7.8:../../wip/py-lark-parser
#DEPENDS+=	${PYPKGPREFIX}-bc-python-hcl2>=0.3.1:../../wip/py-bc-python-hcl2
DEPENDS+=	${PYPKGPREFIX}-yaml>=5.1:../../textproc/py-yaml
DEPENDS+=	${PYPKGPREFIX}-requests>=1.2.0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-tabulate>=0.8.6:../../textproc/py-tabulate
DEPENDS+=	${PYPKGPREFIX}-termcolor>=1.1.0:../../devel/py-termcolor
DEPENDS+=	${PYPKGPREFIX}-gitpython>=3.1.7:../../devel/py-gitpython
DEPENDS+=	${PYPKGPREFIX}-gitdb>=4.0.5:../../devel/py-gitdb
DEPENDS+=	${PYPKGPREFIX}-dpath>=1.5.0:../../wip/py-dpath
DEPENDS+=	${PYPKGPREFIX}-deep-merge>=0.0.4:../../wip/py-deep-merge
#DEPENDS+=	${PYPKGPREFIX}-junit-xml-2>=1.9:../../wip/py-junit-xml-2
DEPENDS+=	${PYPKGPREFIX}-urllib3>=1.25.10:../../www/py-urllib3

USE_LANGUAGES=	# none

post-extract:
	${MV} ${WRKSRC}/bin/checkov ${WRKSRC}/bin/checkov${PYVERSSUFFIX}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
