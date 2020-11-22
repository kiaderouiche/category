# $NetBSD$

DISTNAME=	sqlite-utils-3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/cd/4a/696969f1bb9ab58f0bbaca862814544d0fbf456ced0cb1c6e5bcb95f04a0/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/simonw/sqlite-utils
COMMENT=	CLI tool and Python utility functions for manipulating SQLite databases
#LICENSE=	Apache License, Version 2.0 # TODO: from setup.py; needs to be adjusted

PYTHON_VERSIONS_INCOMPATIBLE=	27

BUILD_DEPENDS+=	${PYPKGPREFIX}-test-runner>=0:../../devel/py-test-runner
DEPENDS+=	${PYPKGPREFIX}-sqlite-fts4>=0:../../wip/py-sqlite-fts4
DEPENDS+=	${PYPKGPREFIX}-click>=0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-click-default-group>=0:../../wip/py-click-default-group
DEPENDS+=	${PYPKGPREFIX}-tabulate>=0:../../textproc/py-tabulate:../../textproc/py-tabulate

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
