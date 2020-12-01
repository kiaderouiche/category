# $NetBSD$

DISTNAME=	panel-0.10.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_PYPI:=p/panel/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://panel.holoviz.org
COMMENT=	High level app and dashboarding solution for Python
LICENSE=	modified-bsd

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=	${PYPKGPREFIX}-tornado>=5.1.1:../../www/py-tornado

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
