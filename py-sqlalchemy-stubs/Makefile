# $NetBSD$

DISTNAME=	sqlalchemy-stubs-0.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/97/f2/5b77bd9c54267a153d17e7ab70e1038929e0f0765b05d7e90a34687110fd/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/dropbox/sqlalchemy-stubs
COMMENT=	SQLAlchemy stubs and mypy plugin
LICENSE=	mit

DEPENDS+=	py-mypy>=0.720:../../lang/py-mypy
DEPENDS+=	py-typing-extensions>=3.7.4:../../devel/py-typing-extensions

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
