# $NetBSD$

DISTNAME=	checkov-1.0.784
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
PKGVERSION=	4
MASTER_SITES=	${MASTER_SITE_PYPI:=c/checkov/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/bridgecrewio/checkov
COMMENT=	Infrastructure as code static analysis
LICENSE=	apache-2.0

PYTHON_VERSIONS_INCOMPATIBLE+=	36

BUILD_DEPENDS+= ${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test
BUILD_DEPENDS+= ${PYPKGPREFIX}-coverage>=5.3:../../devel/py-coverage
BUILD_DEPENDS+=	py-coverage-badge>=0:../../wip/py-coverage-badge
BUILD_DEPENDS+=	py-pipenv-setup>=0:../../wip/py-pipenv-setup
BUILD_DEPENDS+=	# TODO: GitPython==3.1.7>=0
BUILD_DEPENDS+=	py-bandit>=0:../../wip/py-bandit
DEPENDS+=	py-bc-python-hcl2>=0:../../wip/py-bc-python-hcl2
DEPENDS+=	# TODO: deep_merge>=0
DEPENDS+=	py-tabulate>=0:../../textproc/py-tabulate
DEPENDS+=	py-colorama>=0:../../comms/py-colorama
DEPENDS+=	py-termcolor>=0:../../devel/py-termcolor
DEPENDS+=	py-junit-xml>=0:../../wip/py-junit-xml
DEPENDS+=	py-dpath>=1.5.0,<2:../../wip/py-dpath
DEPENDS+=	# TODO: pyyaml>=5.3.1
DEPENDS+=	py-boto3>=0:../../net/py-boto3
DEPENDS+=	# TODO: GitPython>=0
DEPENDS+=	# TODO: six==1.15.0>=0
DEPENDS+=	py-jmespath>=0:../../textproc/py-jmespath
DEPENDS+=	py-tqdm>=0:../../misc/py-tqdm
DEPENDS+=	# TODO: update_checker>=0
DEPENDS+=	py-semantic_version>=0:../../devel/py-semantic_version
DEPENDS+=	py-packaging>=0:../../devel/py-packaging

post-extract:
	${MV} ${WRKSRC}/bin/checkov ${WRKSRC}/bin/checkov${PYVERSSUFFIX}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
