# $NetBSD$

DISTNAME=	junit-xml-2-1.9
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=j/junit-xml/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/returntocorp/python-junit-xml
COMMENT=	Creating JUnit XML test result documents
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
