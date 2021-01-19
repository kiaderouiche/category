# $NetBSD$

DISTNAME=	go-datadog-go-20210107
GITHUB_PROJECT=	datadog-go
GITHUB_TAG=	8a12112
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=DataDog/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/DataDog/datadog-go/
COMMENT=	Go dogstatsd client library for datadog
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}*
GO_SRCPATH=	github.com/DataDog/datadog-go

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
