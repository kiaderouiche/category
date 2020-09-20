# $NetBSD$

DISTNAME=	dc_qiskit_algorithms-0.0.11
PKGNAME=	${PYPKGPREFIX}-dc-qiskit-algorithms-0.0.11
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/30/10/9946030280e0f0159ddab23d1411e9aaef9b99bbbf76d95b61bb7a386e59/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://data-cybernetics.com
COMMENT=	General algorithms with qiskit as basis
LICENSE=	apache-2.0

DEPENDS+=	${PYPKGPREFIX}-qiskit>=0.20.0:../../category/py-qiskit
DEPENDS+=	${PYPKGPREFIX}-scipy>=0:../../math/py-scipy
DEPENDS+=	# TODO: bitstring>=0
DEPENDS+=	${PYPKGPREFIX}-bitarray>=0:../../wip/py-bitarray
DEPENDS+=	# TODO: scikit_learn>=0
DEPENDS+=	${PYPKGPREFIX}-ddt>=0:../../devel/py-ddt
DEPENDS+=	${PYPKGPREFIX}-sympy>=0:../../math/py-sympy
DEPENDS+=	# TODO: nxpd>=0
DEPENDS+=	# TODO: pydot>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
