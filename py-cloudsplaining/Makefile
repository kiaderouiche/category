# $NetBSD$

DISTNAME=	cloudsplaining-0.3.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/a3/6d/8bff0f57426396ced6e65e63c7193171806989edd4586bde6d9044a8aab3/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/kmcquade/cloudsplaining
COMMENT=	AWS IAM Security Assessment tool that identifies violations of least privilege and generates a risk-prioritized HTML report with a triage worksheet
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: policy_sentry>=0.11.3
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-schema>=0:../../wip/py-schema
DEPENDS+=	py-boto3>=0:../../net/py-boto3
DEPENDS+=	py-botocore>=0:../../net/py-botocore
DEPENDS+=	py-markdown>=0:../../textproc/py-markdown
DEPENDS+=	py-jinja2>=0:../../textproc/py-jinja2
DEPENDS+=	py-cached-property>=0:../../devel/py-cached-property
TEST_DEPENDS+=	py-coverage>=0:../../devel/py-coverage
TEST_DEPENDS+=	py-nose>=0:../../devel/py-nose
TEST_DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
