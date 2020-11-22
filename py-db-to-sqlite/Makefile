# $NetBSD$

DISTNAME=	sqlite-utils-3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/cd/4a/696969f1bb9ab58f0bbaca862814544d0fbf456ced0cb1c6e5bcb95f04a0/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/simonw/sqlite-utils
COMMENT=	CLI tool and Python utility functions for manipulating SQLite databases
#LICENSE=	Apache License, Version 2.0 # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	# TODO: pytest-runner>=0
DEPENDS+=	# TODO: sqlite-fts4>=0
DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	# TODO: click-default-group>=0
DEPENDS+=	py-tabulate>=0:../../textproc/py-tabulate

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
