# $NetBSD$

DISTNAME=	qiskit-aer-0.6.1
PKGNAME=        ${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/e4/8e/3c34617ca402913c378ad58c6c345d08c5cc693655c260ccee979cb2c4a3/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/Qiskit/qiskit-aer
COMMENT=	High performance simulators for Qiskit
LICENSE=	apache-2.0

PYTHON_VERSIONS_INCOMPATIBLE=	27

#DEPENDS+=       ${PYPKGPREFIX}-pybind11>=2.5.0:../../devel/py-pybind11
#DEPENDS+=       ${PYPKGPREFIX}-scipy>=1.5.2:../../math/py-scipy
#DEPENDS+=	${PYPKGPREFIX}-qiskit-terra>=0.15.0:../../wip/py-qiskit-terra

.include "../../devel/py-cython/buildlink3.mk"
BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
