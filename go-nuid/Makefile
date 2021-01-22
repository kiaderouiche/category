# $NetBSD$

DISTNAME=	nuid-1.0.1
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	nuid
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=nats-io/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/nats-io/nuid/
COMMENT=	NATS Unique Identifiers
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/nats-io/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
