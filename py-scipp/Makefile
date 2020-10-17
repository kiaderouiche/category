# $NetBSD$

GITHUB_PROJECT=	scipp
GITHUB_TAG=	0.4.0
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${PYPKGPREFIX}-${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=scipp/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/scipp/scipp/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/scipp-0.4.0

DEPENDS+=       ${PYPKGPREFIX}-ipython>=7.18.1:../../devel/py-ipython
DEPENDS+=	${PYPKGPREFIX}-pybind11>=:../../devel/py-pybind11

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
