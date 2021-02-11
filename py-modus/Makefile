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
TEST_DEPENDS+=	${PYPKGPREFIX}-mock>=2.0.0:../../devel/py-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-nose>=1.3.7:../../devel/py-nose
TEST_DEPENDS+=	${PYPKGPREFIX}-pep8>=1.7.0:../../devel/py-pep8
DEPENDS+=       ${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-twisted-[0-9]*:../../net/py-twisted
DEPENDS+=	${PYPKGPREFIX}-zope.interface==4.4.0>=0
DEPENDS+=	${PYPKGPREFIX}-pyasn1==0.2.3>=0
DEPENDS+=	${PYPKGPREFIX}-wsgiref==0.1.2>=0
DEPENDS+=	${PYPKGPREFIX}-cryptography==1.8.1>=0
DEPENDS+=	${PYPKGPREFIX}-tornado==4.5.2>=0
DEPENDS+=	# TODO: #pyserial-asyncio==0.4.0;python_version>="3.4"
DEPENDS+=	${PYPKGPREFIX}-Jinja2==2.9.6>=0
DEPENDS+=	${PYPKGPREFIX}-Pygments==2.2.0>=0
DEPENDS+=	${PYPKGPREFIX}-Sphinx==1.5.5>=0
DEPENDS+=	${PYPKGPREFIX}-docutils==0.13.1>=0
DEPENDS+=	${PYPKGPREFIX}-doctor>=20.12.1:../../wip/py-doctor
DEPENDS+=	${PYPKGPREFIX}-click>=6.7
DEPENDS+=	${PYPKGPREFIX}-prompt-toolkit==2.0.4>=0
DEPENDS+=	${PYPKGPREFIX}-serial>=3.4:../../comms/py-serial


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
