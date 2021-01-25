# $NetBSD$

DISTNAME=	ledisdb-20200510
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	ledisdb
GITHUB_TAG=	d35789ec47e667726160e227e7c05e09627a6d6c
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=ledisdb/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ledisdb/ledisdb/
COMMENT=	High performance NoSQL Database Server powered by Go 
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/ledisdb/${GITHUB_PROJECT}

USE_LANGUAGES=	c c++

post-install:
	${RM} -rf ${DESTDIR}${PREFIX}/gopkg/src/${GO_SRCPATH}/vendor

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
