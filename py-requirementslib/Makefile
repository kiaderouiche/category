# $NetBSD$

DISTNAME=	requirementslib-1.5.15
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=r/requirementslib/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/sarugaku/requirementslib/
COMMENT=	Tool for converting between pip-style and pipfile requirements
LICENSE=	mit

USE_LANGUAGES=	# none

DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-sphinx>=1.15.0:../../textproc/py-sphinx
DEPENDS+=	${PYPKGPREFIX}-sphinx-rtd-theme>=0.4.3:../../textproc/py-sphinx-rtd-theme

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
