# $NetBSD$

DISTNAME=	pymodbus-2.5.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pymodbus/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/riptideio/pymodbus/
COMMENT=	A fully featured modbus protocol stack in python
#LICENSE=	BSD-3-Clause # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-serial>=3.4:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-coverage>=4.4:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-mock>=2.0.0:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-nose>=1.3.7:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-pep8>=1.7.0:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-twisted>=17.1.0:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-zope.interface>=4.4.0:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-asn1>=0.2.3:../../security/py-asn1
DEPENDS+=	${PYPKGPREFIX}-wsgiref>=0.1.2:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-cryptography>=1.8.1:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-tornado>=4.5.2:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-pyserial-asyncio>=0.4.0;python_version>="3.4"
DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.9.6:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-pygments>=2.2.0:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-sphinx>=1.5.5:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-docutils>=0.13.1:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-pydoctor>=16.3.0:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-click>=6.7:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-prompt-toolkit>=2.0.4:../../comms/py-serial

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
