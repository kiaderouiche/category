# $NetBSD$

DISTNAME=	go-pdfcpu-0.3.8
GITHUB_PROJECT=	pdfcpu
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=pdfcpu/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/pdfcpu/pdfcpu/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=	github.com/pdfcpu/pdfcpu
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../wip/go-lzw/buildlink3.mk"
.include "../../wip/go-tiff/buildlink3.mk"
.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-yaml/buildlink3.mk"
<<<<<<< HEAD
=======
.include "../../graphics/go-image/buildlink3.mk"
.include "../../wip/go-lzw/buildlink3.mk"
.include "../../wip/go-tiff/buildlink3.mk"
>>>>>>> b2841a1cf40da6a72ea46e264ccfcfefe1f5905c
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
