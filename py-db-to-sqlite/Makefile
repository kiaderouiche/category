# $NetBSD$

GITHUB_PROJECT=	db-to-sqlite
GITHUB_TAG=	1.3
DISTNAME=	1.3
PKGNAME=	${PYPKGPREFIX}-${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_GITHUB:=simonw/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/simonw/db-to-sqlite
COMMENT=	Exporting tables or queries from any SQL database to a SQLite file
LICENSE=	apache-2.0

DEPENDS+=	${PYPKGPREFIX}-sqlalchemy>=0:../../databases/py-sqlalchemy
DEPENDS+=	# TODO: sqlite-utils>=2.9.1
DEPENDS+=	${PYPKGPREFIX}-click>=0:../../devel/py-click
TEST_DEPENDS+=	${PYPKGPREFIX}-db-to-sqlite[test]>=0

WRKSRC=		${WRKDIR}/db-to-sqlite-1.3

USE_LANGUAGES=	# none


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
