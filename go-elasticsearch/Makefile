# $NetBSD$

DISTNAME=	elasticsearch-7.10.0
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go-elasticsearch
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=elastic/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/elastic/go-elasticsearch/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/elastic/${GITHUB_PROJECT}

USE_TOOLS+=	gmake

.include "../../devel/go-cobra/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../devel/go-yaml/buildlink3.mk"
.include "../../security/go-crypto/buildlink3.mk"
.include "../../textproc/go-chroma/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
