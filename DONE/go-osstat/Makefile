# $NetBSD$

DISTNAME=	osstat-20210118
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go-osstat
GITHUB_TAG=	8f67d17
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=mackerelio/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mackerelio/go-osstat/
COMMENT=	OS system statistics library for Go
LICENSE=	apache-2.0

GO_SRCPATH=	github.com/mackerelio/go-osstat
GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}*

.include "../../devel/go-sys/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
