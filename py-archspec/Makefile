# $NetBSD$

DISTNAME=	archspec-0.1.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/archspec/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/archspec/archspec/
COMMENT=	Library to query system architecture
LICENSE=	apache-2.0 OR mit

PYTHON_VERSIONS_INCOMPATIBLE+=  27

DEPENDS+=	${PYPKGPREFIX}-click>=7.1.2:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
