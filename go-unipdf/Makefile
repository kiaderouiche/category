# $NetBSD$

DISTNAME=	go-unipdf-3.17.0
GITHUB_PROJECT=	unipdf
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_GITHUB:=unidoc/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/unidoc/unipdf/
COMMENT=	Golang PDF library for creating and processing PDF files
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=     github.com/unidoc/unipdf
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../devel/go-testify/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
