# $NetBSD$

DISTNAME=	go-${GITHUB_PROJECT}-0.2.1
GITHUB_PROJECT=	klangsynthese
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=200sc/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/200sc/klangsynthese/
COMMENT=	Waveform and Audio Synthesis library in Go
LICENSE=	apache-2.0

GO_SRCPATH=     github.com/200sc/klangsynthese
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../devel/go-errors/buildlink3.mk"
.include "../../wip/go-flac-eaburns/buildlink3.mk"
.include "../../wip/go-mp3/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
