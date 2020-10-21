# $NetBSD$

DISTNAME=	compyle-0.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	parallel python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/compyle/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/pypr/compyle
COMMENT=	Execute a subset of Python on HPC platforms
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx>=0:../../textproc/py-sphinx
DEPENDS+=	${PYPKGPREFIX}-mako>=0:../../devel/py-mako
DEPENDS+=	${PYPKGPREFIX}-pytools>=0:../../wip/py-pytools
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=0:../../devel/py-test

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-cython+=	${PYPKGPREFIX}-cython>=0
.include "../../devel/py-cython/buildlink3.mk"
BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
