# $NetBSD$

DISTNAME=	textX-2.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	parallel python
MASTER_SITES=	${MASTER_SITE_PYPI:=t/textX/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://textx.github.io/textX/
COMMENT=	Domain-Specific Languages and parsers in Python made easy
LICENSE=	mit

DEPEND= ${PYPKGPREFIX}-twine>=1.13.0:../../net/py-twine
TEST_DEPEND= ${PYPKGPREFIX}-flake8>=:../../devel/py-flake8

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
