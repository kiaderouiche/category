# $NetBSD$

DISTNAME=	checkov2-1.0.946
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/checkov2/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/nimrodkor/checkov
COMMENT=	Infrastructure as code static analysis
LICENSE=	apache-2.0

BUILD_DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage>=5.3.1:../../devel/py-coverage
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage-badge>=1.0.1:../../wip/py-coverage-badge
BUILD_DEPENDS+=	${PYPKGPREFIX}-pipenv-setup>=3.1.1:../../wip/py-pipenv-setup
BUILD_DEPENDS+=	${PYPKGPREFIX}-bandit>=1.7.0:../../wip/py-bandit
DEPENDS+=	# TODO: bc-python-hcl2>=0.3.18
DEPENDS+=	# TODO: cloudsplaining>=0.3.2
DEPENDS+=	# TODO: deep_merge>=0
DEPENDS+=	${PYPKGPREFIX}-tabulate>=0.8.6:../../textproc/py-tabulate
DEPENDS+=	${PYPKGPREFIX}-colorama>=0.4.3:../../comms/py-colorama
DEPENDS+=	py-termcolor>=0:../../devel/py-termcolor
DEPENDS+=	# TODO: junit-xml>=0
DEPENDS+=	# TODO: dpath>=1.5.0,<2
DEPENDS+=	# TODO: pyyaml>=5.4.1
DEPENDS+=	py-boto3>=0:../../net/py-boto3
DEPENDS+=	# TODO: GitPython>=0
DEPENDS+=	# TODO: six==1.15.0>=0
DEPENDS+=	py-jmespath>=0:../../textproc/py-jmespath
DEPENDS+=	py-tqdm>=0:../../misc/py-tqdm
DEPENDS+=	# TODO: update_checker>=0
DEPENDS+=	py-semantic_version>=0:../../devel/py-semantic_version
DEPENDS+=	py-packaging>=0:../../devel/py-packaging
DEPENDS+=	py-networkx>=0:../../math/py-networkx

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
