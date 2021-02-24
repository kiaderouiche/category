# $NetBSD$

DISTNAME=	pathy-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/92/c2/6897bc8e1b3f0b12316f58db72b3ae5dccf4fb0550387696d2183c57c86e/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/justindujardin/pathy
COMMENT=	pathlib.Path subclasses for local and cloud bucket storage
LICENSE=	apache-2.0

DEPENDS+=	# TODO: smart-open>=2.2.0,<4.0.0
DEPENDS+=	# TODO: py-typer>=0.3.0,<1.0.0
DEPENDS+=	py-dataclasses>=0.6,<1.0;python_version<"3.7":../../wip/py-dataclasses

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
