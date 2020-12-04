# $NetBSD$

DISTNAME=	checkov-1.0.626
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/checkov/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/bridgecrewio/checkov
COMMENT=	Infrastructure as code static analysis
LICENSE=	apache-2.0

BUILD_DEPENDS+=	${PYPKGPREFIX}-alabaster==0.7.12>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-attrs==19.3.0>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-babel==2.7.0>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-certifi==2019.11.28>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-chardet==3.0.4>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage==4.5.4>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage-badge==1.0.1>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-docopt==0.6.2>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-docutils==0.15.2>=0:../../textproc/py-jmespath
BUILD_DEPENDS+=	${PYPKGPREFIX}-idna==2.8>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-imagesize==1.1.0>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-importlib-metadata==1.1.0;python_version<'3.8'>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-jinja2==2.10.3>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-lark-parser==0.7.8>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-markupsafe==1.1.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-more-itertools==8.0.0>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-packaging==19.2>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pluggy==0.13.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-py==1.8.0>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pygments==2.5.2>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-pyparsing==2.4.5>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-test==5.3.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-TODO: bc-python-hcl2>=0.3.10
BUILD_DEPENDS+=	${PYPKGPREFIX}-pytz==2019.3>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-snowballstemmer==2.0.0>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx==2.2.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-applehelp==1.0.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-devhelp==1.0.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-htmlhelp==1.0.2>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-jsmath==1.0.1>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-qthelp==1.0.2>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinxcontrib-serializinghtml==1.1.3>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-wcwidth==0.1.7>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-zipp==0.6.0>=0
DEPENDS+=	${PYPKGPREFIX}-update-checker>=0.18.0
DEPENDS+=	${PYPKGPREFIX}-tqdm>=4.49.0
DEPENDS+=	${PYPKGPREFIX}-boto3>=1.12.43
DEPENDS+=	${PYPKGPREFIX}-chardet>=3.0.4
DEPENDS+=	${PYPKGPREFIX}-colorama>=0.4.3
DEPENDS+=	${PYPKGPREFIX}-docopt>=0.6.2
DEPENDS+=	${PYPKGPREFIX}- idna>=2.8
DEPENDS+=	${PYPKGPREFIX}-jmespath>=0.10.0:../../textproc/py-jmespath
DEPENDS+=	${PYPKGPREFIX}-junit-xml==1.8>=
DEPENDS+=	${PYPKGPREFIX}-lark-parser==0.7.8>=
DEPENDS+=	${PYPKGPREFIX}-bc-python-hcl2>=0.3.11
DEPENDS+=	${PYPKGPREFIX}-pyyaml==5.3.1>=0
DEPENDS+=	${PYPKGPREFIX}-requests>=1.2.0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-tabulate==0.8.6>=
DEPENDS+=	${PYPKGPREFIX}-termcolor==1.1.0>=
DEPENDS+=	${PYPKGPREFIX}-urllib3==1.25.10>=
DEPENDS+=	${PYPKGPREFIX}-dpath==1.5.0>=
DEPENDS+=	${PYPKGPREFIX}-GitPython==3.1.7>=
DEPENDS+=	${PYPKGPREFIX}-gitdb==4.0.5>=

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
