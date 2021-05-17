# $NetBSD$

DISTNAME=	pyarmadillo-0.500.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	math
MASTER_SITES=	https://sourceforge.net/projects/pyarma/files/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://sourceforge.net/projects/pyarma/files/
COMMENT=	Linear algebra library for Python, with emphasis on ease of use
LICENSE=	apache-2.0

USE_CMAKE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	pkg-config

PYTHON_VERSIONS_INCOMPATIBLE+=  27

#gcc>=4.8.3
DEPENDS+=	${PYPKGPREFIX}-pybind11>=2.6.2:../../devel/py-pybind11

BUILDLINK_API_DEPENDS.hdf5+=    hdf5>=1.8.7
.include "../../devel/hdf5/buildlink3.mk"
#.include "../../math/arpack/buildlink3.mk"
.include "../../math/blas/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
