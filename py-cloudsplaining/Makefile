# $NetBSD$

DISTNAME=	cloudsplaining-0.3.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	net python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/cloudsplaining/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/kmcquade/cloudsplaining
COMMENT=	AWS IAM Security Assessment tool that identifies violations of least privilege
LICENSE=	mit

DEPENDS+=	# TODO: policy_sentry>=0.11.3
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-schema>=0:../../wip/py-schema
DEPENDS+=	${PYPKGPREFIX}-boto3>=1.12.43:../../net/py-boto3
DEPENDS+=	${PYPKGPREFIX}-botocore>=1.20.15:../../net/py-botocore
DEPENDS+=	py-markdown>=0:../../textproc/py-markdown
DEPENDS+=	py-jinja2>=0:../../textproc/py-jinja2
DEPENDS+=	py-cached-property>=1.5.2:../../devel/py-cached-property
TEST_DEPENDS+=	${PYPKGPREFIX}-coverage>=5.3.1:../../devel/py-coverage
TEST_DEPENDS+=	py-nose>=0:../../devel/py-nose
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
