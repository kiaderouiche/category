# $NetBSD$

DISTNAME=	pydantic-1.6.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/80/0a/75c950d621652f7d626225c1d8275d15e9119548b6faa7d0485a253ff181/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/samuelcolvin/pydantic
COMMENT=	Data validation and settings management using python 3.6 type hinting
LICENSE=	mit

DEPENDS+=	py-dataclasses>=0.6;python_version<"3.7":../../wip/py-dataclasses

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
