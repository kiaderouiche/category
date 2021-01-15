# $NetBSD$

DISTNAME=	timestamp-20210103
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	timestamp
GITHUB_TAG=	54ddd7720e27f9d5932ac802bb6d26a5f1fdb020
CATEGORIES=	time
MASTER_SITES=	${MASTER_SITE_GITHUB:=digitorus/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/digitorus/timestamp/
COMMENT=	Time-Stamp Protocol (TSP) package for Go
LICENSE=	2-clause-bsd

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/mozilla-services/${GITHUB_PROJECT}

.include "../../wip/go-pkcs7/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
