# $NetBSD$

GITHUB_PROJECT=	scipp
GITHUB_TAG=	0.4.0
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${PYPKGPREFIX}-${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=scipp/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/scipp/scipp/
COMMENT=	Multi-dimensional data arrays with labeled dimensions
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/scipp-0.4.0

DEPENDS+=       ${PYPKGPREFIX}-ipython>=7.18.1:../../devel/py-ipython
DEPENDS+=	${PYPKGPREFIX}-pybind11>=:../../devel/py-pybind11

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

PYTHON_VERSIONS_INCOMPATIBLE=	27
PYTHON_FOR_BUILD_ONLY=  yes

BUILDLINK_API_DEPENDS.boost-headers+=   boost-headers-1.73.*
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
