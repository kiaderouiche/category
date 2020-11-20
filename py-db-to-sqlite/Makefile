# $NetBSD$

GITHUB_PROJECT=	db-to-sqlite
GITHUB_TAG=	1.3
DISTNAME=	1.3
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_GITHUB:=simonw/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/simonw/db-to-sqlite
COMMENT=	CLI tool for exporting tables or queries from any SQL database to a SQLite file
#LICENSE=	Apache License, Version 2.0 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-sqlalchemy>=0:../../databases/py-sqlalchemy
DEPENDS+=	# TODO: sqlite-utils>=2.9.1
DEPENDS+=	py-click>=0:../../devel/py-click
TEST_DEPENDS+=	# TODO: db-to-sqlite[test]>=0

WRKSRC=		${WRKDIR}/db-to-sqlite-1.3
USE_LANGUAGES=	# none

# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
