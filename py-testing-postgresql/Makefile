# $NetBSD$

DISTNAME=	testing.postgresql-1.3.0
PKGNAME=	${PYPKGPREFIX}-testing-postgresql-1.3.0
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=t/testing.postgresql/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/tk0miya/testing.postgresql
COMMENT=	automatically setups a postgresql instance in a temporary directory, and destroys it after testing
LICENSE=	apache-2.0

DEPENDS+=	# TODO: testing.common.database>=0
DEPENDS+=	# TODO: pg8000>=1.10

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
