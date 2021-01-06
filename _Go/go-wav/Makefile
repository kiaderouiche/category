# $NetBSD$

DISTNAME=	go-wav-1.0.0
GITHUB_PROJECT=	wav
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-audio/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/go-audio/wav/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=     github.com/go-audio/wav
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../wip/go-audio/buildlink3.mk"
.include "../../wip/go-riff/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
