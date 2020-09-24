# $NetBSD$

DISTNAME=	go-fyne-1.3.3
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=fyne-io/}
GITHUB_PROJECT=	fyne
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/fyne-io/fyne/
COMMENT=	Cross platform GUI in Go based on Material Design
LICENSE=	modified-bsd

WRKSRC=	${WRKDIR}/fyne-1.3.3

EXTRACT_USING=	bsdtar

GO_SRCPATH=	github.com/fyne-io/fyne
GO_DIST_BASE=	fyne-${PKGVERSION_NOREV}

.include "../../x11/libXcursor/buildlink3.mk"
.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
