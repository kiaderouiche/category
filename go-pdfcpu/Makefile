# $NetBSD$

DISTNAME=	pdfcpu-0.3.8
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	pdfcpu
GITHUB_TAG=	a6b03956e5c6215e60f00d410ed382efd2bb8660
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=pdfcpu/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://pdfcpu.io/
COMMENT=	Tool for PDF processor manipulate written in Go
LICENSE=	apache-2.0

GO_SRCPATH=     github.com/pdfcpu/pdfcpu
GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}

.include "../../wip/go-lzw/buildlink3.mk"
.include "../../wip/go-tiff/buildlink3.mk"
.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-yaml/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
