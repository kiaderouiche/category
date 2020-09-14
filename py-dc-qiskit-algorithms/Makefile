# $NetBSD$

DISTNAME=	dc_qiskit_algorithms-0.0.11
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/30/10/9946030280e0f0159ddab23d1411e9aaef9b99bbbf76d95b61bb7a386e59/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://data-cybernetics.com
COMMENT=	General algorithms with qiskit as basis
LICENSE=	apache-2.0

DEPENDS+=	py-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	py-qiskit>=0.20.0:../../category/py-qiskit
DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	# TODO: bitstring>=0
DEPENDS+=	py-bitarray>=0:../../wip/py-bitarray
DEPENDS+=	# TODO: scikit_learn>=0
DEPENDS+=	py-ddt>=0:../../devel/py-ddt
DEPENDS+=	py-sympy>=0:../../math/py-sympy
DEPENDS+=	# TODO: nxpd>=0
DEPENDS+=	# TODO: pydot>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
