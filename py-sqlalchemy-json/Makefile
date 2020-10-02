# $NetBSD$

DISTNAME=	sqlalchemy-json-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f0/8b/a8efb371baa9367751319ce60bdd258fbf292306d11c389182544ae6844a/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/edelooff/sqlalchemy-json
COMMENT=	JSON type with nested change tracking for SQLAlchemy
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-six>=0:../../lang/py-six
DEPENDS+=	py-sqlalchemy>=0.7:../../databases/py-sqlalchemy

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
