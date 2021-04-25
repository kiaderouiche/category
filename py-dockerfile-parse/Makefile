# $NetBSD$

DISTNAME=	dockerfile-parse-1.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	net devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/dockerfile-parse/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/containerbuildsystem/dockerfile-parse
COMMENT=	Python library for Dockerfile manipulation
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test
TEST_DEPENDS+=	${PYPKGPREFIX}-test-cov>=2.11.1:../../devel/py-test-cov


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
