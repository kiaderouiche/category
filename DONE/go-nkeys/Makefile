# $NetBSD$

DISTNAME=	nkeys-0.2.0
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	nkeys
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=nats-io/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/nats-io/nkeys/
COMMENT=	Public-key signature system based on Ed25519 for the NATS ecosystem
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/nats-io/nkeys

.include "../../security/go-crypto/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
