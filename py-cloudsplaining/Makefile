# $NetBSD$

DISTNAME=	cloudsplaining-0.3.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	net python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/cloudsplaining/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/kmcquade/cloudsplaining
COMMENT=	AWS IAM Security Assessment tool that identifies violations of least privilege
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-policy-sentry>=0.11.3:../../wip/py-policy-sentry
DEPENDS+=	${PYPKGPREFIX}-click>=0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-schema>=0.7.4:../../wip/py-schema
DEPENDS+=	${PYPKGPREFIX}-boto3>=1.12.43:../../net/py-boto3
DEPENDS+=	${PYPKGPREFIX}-botocore>=1.20.15:../../net/py-botocore
DEPENDS+=	${PYPKGPREFIX}-markdown>=3.1.1:../../textproc/py-markdown
DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.11.3:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-cached-property>=1.5.2:../../devel/py-cached-property
TEST_DEPENDS+=	${PYPKGPREFIX}-coverage>=5.3.1:../../devel/py-coverage
TEST_DEPENDS+=	${PYPKGPREFIX}-nose>=1.3.7:../../devel/py-nose
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
