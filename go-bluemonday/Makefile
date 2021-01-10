# $NetBSD$

DISTNAME=	go-bluemonday-1.0.4
GITHUB_PROJECT=	bluemonday
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=microcosm-cc/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/microcosm-cc/bluemonday/
COMMENT=	HTML sanitizer implemented in Go
LICENSE=	2-clause-bsd

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/microcosm-cc/${GITHUB_PROJECT}

.include "../../net/go-net/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
