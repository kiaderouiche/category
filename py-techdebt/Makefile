# $NetBSD$

DISTNAME=	techdebt-0.1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=t/techdebt/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/lcetinsoy/tech-debt
COMMENT=	Technical debt tracker package
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-matplotlib>=3.2.2:../../graphics/py-matplotlib
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
