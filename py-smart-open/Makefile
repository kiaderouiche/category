# $NetBSD$

DISTNAME=	smart_open-4.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/c3/ff/f8ac652bc62fc78a35b0201d922e43da63e3469a6eab1d71776af6dd7844/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/piskvorky/smart_open
COMMENT=	Utils for streaming large files (S3, HDFS, GCS, Azure Blob Storage, gzip, bz2...)
LICENSE=	mit

TEST_DEPENDS+=	py-boto3>=0:../../net/py-boto3
TEST_DEPENDS+=	# TODO: google-cloud-storage>=0
TEST_DEPENDS+=	# TODO: azure-storage-blob>=0
TEST_DEPENDS+=	# TODO: azure-common>=0
TEST_DEPENDS+=	# TODO: azure-core>=0
TEST_DEPENDS+=	py-requests>=0:../../devel/py-requests
TEST_DEPENDS+=	py-mock>=0:../../devel/py-mock
TEST_DEPENDS+=	# TODO: moto[server]==1.3.14>=0
TEST_DEPENDS+=	py-pathlib2>=0:../../devel/py-pathlib2
TEST_DEPENDS+=	py-responses>=0:../../net/py-responses
TEST_DEPENDS+=	py-boto3>=0:../../net/py-boto3
TEST_DEPENDS+=	py-paramiko>=0:../../security/py-paramiko
TEST_DEPENDS+=	# TODO: parameterizedtestcase>=0
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	# TODO: pytest-rerunfailures>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
