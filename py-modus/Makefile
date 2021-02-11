# $NetBSD$

DISTNAME=	pymodbus-2.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pymodbus/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/riptideio/pymodbus/
COMMENT=	Fully featured modbus protocol stack in python
LICENSE=	modified-bsd


TEST_DEPENDS+=	${PYPKGPREFIX}-coverage>=5.3:../../devel/py-coverage
TEST_DEPENDS+=	# TODO: #mock==2.0.0>=0
TEST_DEPENDS+=	# TODO: #nose==1.3.7>=0
TEST_DEPENDS+=	# TODO: #pep8==1.7.0>=0
DEPENDS+=       ${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	# TODO: #pyserial>=3.4
DEPENDS+=	# TODO: #Twisted==17.1.0>=0
DEPENDS+=	# TODO: #zope.interface==4.4.0>=0
DEPENDS+=	# TODO: #pyasn1==0.2.3>=0
DEPENDS+=	# TODO: #wsgiref==0.1.2>=0
DEPENDS+=	# TODO: #cryptography==1.8.1>=0
DEPENDS+=	# TODO: #tornado==4.5.2>=0
DEPENDS+=	# TODO: #pyserial-asyncio==0.4.0;python_version>="3.4"
DEPENDS+=	# TODO: #Jinja2==2.9.6>=0
DEPENDS+=	# TODO: #Pygments==2.2.0>=0
DEPENDS+=	# TODO: #Sphinx==1.5.5>=0
DEPENDS+=	# TODO: #docutils==0.13.1>=0
DEPENDS+=	#${PYPKGPREFIX}-doctor>=20.12.1:../../wip/py-doctor
DEPENDS+=	# TODO: #click>=6.7
DEPENDS+=	# TODO: #prompt-toolkit==2.0.4>=0
DEPENDS+=	# TODO: pyserial>=3.4


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
