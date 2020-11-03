# $NetBSD$

DISTNAME=	towncrier-19.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=t/towncrier/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/hawkowl/towncrier
COMMENT=	Building newsfiles for your project
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-click>=0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-incremental>=0:../../devel/py-incremental
DEPENDS+=	${PYPKGPREFIX}-jinja2>=0:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-toml>=0:../../textproc/py-toml

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
