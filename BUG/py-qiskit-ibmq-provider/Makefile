# $NetBSD$

DISTNAME=	qiskit-ibmq-provider-0.9.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/83/f6/fefebe2e8b1d7a466e19d9b8e764634acfc0cf30f6f2e224400fb3061717/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/Qiskit/qiskit-ibmq-provider
COMMENT=	Qiskit provider for accessing the quantum devices and simulators at IBMQ
LICENSE=	apache-2.0

DEPENDS+=	${PYPKGPREFIX}-nest-asyncio>=1.0.0,!=1.1.0:../../category/py-nest-asyncio
DEPENDS+=	${PYPKGPREFIX}-qiskit-terra>=0.14:../../wip/py-qiskit-terra
DEPENDS+=	${PYPKGPREFIX}-requests>=2.19:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-requests-ntlm>=1.1.0:../../security/py-requests-ntlm
DEPENDS+=	${PYPKGPREFIX}-websockets>=7,<8;python_version<='3.6':../../www/py-websockets
DEPENDS+=	${PYPKGPREFIX}-websockets>=8;python_version>'3.6':../../www/py-websockets
DEPENDS+=	${PYPKGPREFIX}-urllib3>=1.21.1:../../www/py-urllib3
#DEPENDS+=	${PYPKGPREFIX}-dateutil>=2.8.0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.13
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
