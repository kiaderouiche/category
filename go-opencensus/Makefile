# $NetBSD$

DISTNAME=	go-opencensus-0.22.5
GITHUB_PROJECT=	opencensus-go
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=census-instrumentation/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://opencensus.io/
COMMENT=	Stats collection and distributed tracing framework 
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/census-instrumentation/opencensus-go

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
