# $NetBSD$

DISTNAME=	go-aiff-1.0.0
GITHUB_PROJECT=	aiff
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-audio/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/go-audio/aiff/
COMMENT=	Battle tested aiff decoder/encoder
LICENSE=	apache-2.0

GO_SRCPATH=     github.com/go-audio/aiff
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../wip/go-audio/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
