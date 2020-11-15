# $NetBSD$

DISTNAME=	testfixtures-6.15.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=t/testfixtures/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/Simplistix/testfixtures
COMMENT=	Collection of helpers and mock objects for unit tests and doc tests
LICENSE=	mit

USE_LANGUAGES=	# none

BUILD_DEPENDS+=	${PYPKGPREFIX}-twine>=1.13.0:../../devel/py-twine
BUILD_DEPENDS+=	${PYPKGPREFIX}-wheel>=0.29.0:../../devel/py-wheel
DEPENDS+=	${PYPKGPREFIX}-test>=5.2:../../devel/py-test
DEPENDS+=	${PYPKGPREFIX}-test-cov>=5.2:../../devel/py-test-cov
DEPENDS+=	${PYPKGPREFIX}-test-django>=5.2:../../devel/py-test-django


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
