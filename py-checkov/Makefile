# $NetBSD$

DISTNAME=	checkov-2.0.69
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
PKGVERSION=	5
MASTER_SITES=	${MASTER_SITE_PYPI:=c/checkov/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/nimrodkor/checkov
COMMENT=	Infrastructure as code static analysis
LICENSE=	apache-2.0

PYTHON_VERSIONS_INCOMPATIBLE+=  27 36


BUILD_DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test
BUILD_DEPENDS+=	py-coverage>=0:../../devel/py-coverage
BUILD_DEPENDS+=	py-coverage-badge>=0:../../wip/py-coverage-badge
BUILD_DEPENDS+=	py-bandit>=0:../../wip/py-bandit
DEPENDS+=	terraform>=0.12.30:../../net/terraform
DEPENDS+=	py-bc-python-hcl2>=0.3.18:../../wip/py-bc-python-hcl2
DEPENDS+=	# TODO: cloudsplaining>=0.4.1
DEPENDS+=	# TODO: deep_merge>=0
DEPENDS+=	py-tabulate>=0:../../textproc/py-tabulate
DEPENDS+=	py-colorama>=0:../../comms/py-colorama
DEPENDS+=	py-termcolor>=0:../../devel/py-termcolor
DEPENDS+=	py-junit-xml>=0:../../wip/py-junit-xml
DEPENDS+=	py-dpath>=1.5.0,<2:../../wip/py-dpath
DEPENDS+=	# TODO: pyyaml>=5.4.1
DEPENDS+=	# TODO: boto3==1.17.27>=0
DEPENDS+=	# TODO: GitPython>=0
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-jmespath>=0.10.0:../../textproc/py-jmespath
DEPENDS+=	${PYPKGPREFIX}-tqdm>=4.49.0:../../misc/py-tqdm
DEPENDS+=	${PYPKGPREFIX}-update-checker-[0-9]*:../../wip/py-update-checker
DEPENDS+=	${PYPKGPREFIX}-semantic_version>=2.8.5:../../devel/py-semantic_version
DEPENDS+=	${PYPKGPREFIX}-packaging>=19.2:../../devel/py-packaging
DEPENDS+=	py-networkx>=0:../../math/py-networkx
DEPENDS+=	# TODO: dockerfile-parse>=0

post-extract:
	${MV} ${WRKSRC}/bin/checkov ${WRKSRC}/bin/checkov${PYVERSSUFFIX}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
