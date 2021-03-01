# $NetBSD$

DISTNAME=	smart_open-4.2.0
PKGNAME=	${PYPKGPREFIX}-smart-open-4.2.0
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/smart_open/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/piskvorky/smart_open
COMMENT=	Utils for streaming large files
LICENSE=	mit

TEST_DEPENDS+=	${PYPKGPREFIX}-boto3>=0:../../net/py-boto3:../../
TEST_DEPENDS+=	${PYPKGPREFIX}-google-cloud-storage>=0:../../
TEST_DEPENDS+=	${PYPKGPREFIX}-azure-storage-blob>=0:../../
TEST_DEPENDS+=	${PYPKGPREFIX}-azure-common>=0:../../
TEST_DEPENDS+=	${PYPKGPREFIX}-azure-core>=0:../../
TEST_DEPENDS+=	${PYPKGPREFIX}-requests>=0:../../devel/py-requests
TEST_DEPENDS+=	${PYPKGPREFIX}-mock>=0:../../devel/py-mock
TEST_DEPENDS+=	# TODO: moto[server]==1.3.14>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-pathlib2>=0:../../devel/py-pathlib2
TEST_DEPENDS+=	${PYPKGPREFIX}-responses>=0:../../net/py-responses
TEST_DEPENDS+=	${PYPKGPREFIX}-paramiko>=0:../../security/py-paramiko
TEST_DEPENDS+=	${PYPKGPREFIX}-parameterizedtestcase>=0.1.0:../../wip/py-parameterizedtestcase
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=0:../../devel/py-test
TEST_DEPENDS+=	${PYPKGPREFIX}-test-rerunfailures>=0:../../devel/py-rerunfailures


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
