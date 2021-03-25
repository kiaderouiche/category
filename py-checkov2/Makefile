# $NetBSD$

DISTNAME=	checkov2-1.0.946
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/d3/04/190fd015abbdce6ebae611265ce5a35490b2d95f4033d26193ecaace3bfa/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/nimrodkor/checkov
COMMENT=	Infrastructure as code static analysis
LICENSE=	apache-2.0

BUILD_DEPENDS+=	# TODO: pytest==5.3.1>=0
BUILD_DEPENDS+=	py-coverage>=0:../../devel/py-coverage
BUILD_DEPENDS+=	# TODO: coverage-badge>=0
BUILD_DEPENDS+=	# TODO: pipenv-setup>=0
BUILD_DEPENDS+=	# TODO: GitPython==3.1.7>=0
BUILD_DEPENDS+=	# TODO: bandit>=0
DEPENDS+=	# TODO: bc-python-hcl2>=0.3.18
DEPENDS+=	# TODO: cloudsplaining>=0.3.2
DEPENDS+=	# TODO: deep_merge>=0
DEPENDS+=	py-tabulate>=0:../../textproc/py-tabulate
DEPENDS+=	py-colorama>=0:../../comms/py-colorama
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
