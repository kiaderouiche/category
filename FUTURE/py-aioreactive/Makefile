# $NetBSD$

DISTNAME=	aioreactive-0.14.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/aioreactive/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/dbrattli/aioreactive
COMMENT=	Async/await Reactive Tools for Python 3.9+
LICENSE=	mit

PYTHON_VERSIONS_ACCEPTED=	39

DEPENDS+=	${PYPKGPREFIX}-expression>=0.45.0:../../wip/py-expression

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
