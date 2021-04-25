# $NetBSD$

DISTNAME=	checkov-2.0.69
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/46/d3/4edfa6c26541adc50ab1ab4c3a96c6d1acebadf92affdc2c25606c3edbab/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/nimrodkor/checkov
COMMENT=	Infrastructure as code static analysis
LICENSE=	apache-2.0

BUILD_DEPENDS+=	# TODO: pytest==5.3.1>=0
BUILD_DEPENDS+=	py-coverage>=0:../../devel/py-coverage
BUILD_DEPENDS+=	py-coverage-badge>=0:../../wip/py-coverage-badge
BUILD_DEPENDS+=	# TODO: GitPython==3.1.7>=0
BUILD_DEPENDS+=	py-bandit>=0:../../wip/py-bandit
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
DEPENDS+=	# TODO: six==1.15.0>=0
DEPENDS+=	py-jmespath>=0:../../textproc/py-jmespath
DEPENDS+=	py-tqdm>=0:../../misc/py-tqdm
DEPENDS+=	# TODO: update_checker>=0
DEPENDS+=	py-semantic_version>=0:../../devel/py-semantic_version
DEPENDS+=	py-packaging>=0:../../devel/py-packaging
DEPENDS+=	py-networkx>=0:../../math/py-networkx
DEPENDS+=	# TODO: dockerfile-parse>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
