# $NetBSD$

DISTNAME=	dockerfile-parse-1.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/dockerfile-parse/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/containerbuildsystem/dockerfile-parse
COMMENT=	Python library for Dockerfile manipulation
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=4.1.0:../../wip/py-test
TEST_DEPENDS+=	${PYPKGPREFIX}-test-cov>=0:../../wip/py-test-cov
TEST_DEPENDS+=	${PYPKGPREFIX}-test-html>=1.17.0:../../wip/py-test-html
TEST_DEPENDS+=	${PYPKGPREFIX}-flake8>=0:../../devel/py-flake8

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
