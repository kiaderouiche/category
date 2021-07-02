# $NetBSD$

DISTNAME=	pymodbus-2.5.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pymodbus/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/riptideio/pymodbus/
COMMENT=	Fully featured modbus protocol stack in python
#LICENSE=	BSD-3-Clause # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-serial>=3.4:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-coverage>=4.4:../../devel/py-coverage
DEPENDS+=	${PYPKGPREFIX}-mock>=2.0.0:../../devel/py-mock
DEPENDS+=	${PYPKGPREFIX}-nose>=1.3.7:../../devel/py-nose
DEPENDS+=	${PYPKGPREFIX}-pep8>=1.7.0:../../devel/py-pep8
DEPENDS+=	${PYPKGPREFIX}-twisted>=17.1.0:../../net/py-twisted
DEPENDS+=	${PYPKGPREFIX}-ZopeInterface>=4.4.0:../../devel/py-ZopeInterface
DEPENDS+=	${PYPKGPREFIX}-asn1>=0.2.3:../../security/py-asn1
DEPENDS+=	${PYPKGPREFIX}-wsgiref>=0.1.2:../../wip/py-py-wsgiref
DEPENDS+=	${PYPKGPREFIX}-cryptography>=1.8.1:../../security/py-cryptography
DEPENDS+=	${PYPKGPREFIX}-tornado>=4.5.2:../../www/py-tornadol
DEPENDS+=	${PYPKGPREFIX}-serial-asyncio>=0.4.0;python_version>="3.4"
DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.9.6:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-pygments>=2.2.0:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-sphinx>=1.5.5:../../textproc/py-sphinx
DEPENDS+=	${PYPKGPREFIX}-docutils>=0.13.1:../../devel/py-docutils
DEPENDS+=	${PYPKGPREFIX}-doctor>=16.3.0:../../devel/py-doctor
DEPENDS+=	${PYPKGPREFIX}-click>=6.7:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-prompt-toolkit>=2.0.4:../../devel/py-prompt-toolkit

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
