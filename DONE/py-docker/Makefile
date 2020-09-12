# $NetBSD$

DISTNAME=	docker-4.2.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	https://files.pythonhosted.org/packages/d8/19/25ddbe30edff87274afb2b364c653c7f7bbdd515337700377f1adf0834c5/

MAINTAINER=	kamelderouiche@yahoo.com # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/docker/docker-py
COMMENT=	Python library for the Docker Engine API
LICENSE=	apache-2.0


#DEPENDS+=	${PYPKGPREFIX}-appdirs>=1.4.4:../../devel/py-appdirs
#DEPENDS+=	${PYPKGPREFIX}-asn1crypto>=1.3.0:../../security/py-asn1crypto
#DEPENDS+=	${PYPKGPREFIX}-cffipy>=1.14.0:../../devel/py-cffi
#DEPENDS+=	${PYPKGPREFIX}-cryptography>=2.9.2:../../security/py-cryptography
#DEPENDS+=      ${PYPKGPREFIX}-paramiko>=2.1:../../security/py-paramiko
#DEPENDS+=      ${PYPKGPREFIX}-cparser>=2.20>:../../devel-cparser
#DEPENDS+=      ${PYPKGPREFIX}-pyparsingidna>=2.4.7:../../devel/py-pyparsing
#DEPENDS+=      ${PYPKGPREFIX}-idna>=2.1:../../www/py-idna
#DEPENDS+=      ${PYPKGPREFIX}-urllib3>=1.25.10:../../www/py-urllib3
#DEPENDS+=      ${PYPKGPREFIX}-OpenSSL>=0.14:../../security/py-OpenSSL
#DEPENDS+=	${PYPKGPREFIX}-enum34>=1.1.10:../../devel/py-enum34
#DEPENDS+=	${PYPKGPREFIX}-ipaddress>=1.4.0:../../net/py-ipaddress
#DEPENDS+=	${PYPKGPREFIX}-packaging>=19.2:../../devel/py-packaging
#DEPENDS+=	${PYPKGPREFIX}-websocket-client>=0.32.0:../../www/py-websocket-client
#DEPENDS+=	${PYPKGPREFIX}-requests>=2.14.2,!=2.18.0:../../devel/py-requests

TEST_DEPENDS+=	# TODO: setuptools==44.0.0#lastversionwithpython2.7support>=0
TEST_DEPENDS+=	# TODO: coverage==4.5.2>=0
TEST_DEPENDS+=	# TODO: flake8==3.6.0>=0
TEST_DEPENDS+=	# TODO: mock==1.0.1>=0
TEST_DEPENDS+=	# TODO: pytest==4.3.1>=0
TEST_DEPENDS+=	# TODO: pytest-cov==2.6.1>=0
TEST_DEPENDS+=	# TODO: pytest-timeout==1.3.3>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
