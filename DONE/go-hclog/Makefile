# $NetBSD$

DISTNAME=	go-hclog-0.15.0
GITHUB_PROJECT=	go-hclog
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=hashicorp/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/hashicorp/go-hclog/
COMMENT=	Common logging package for HashiCorp tools 
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/hashicorp/${GITHUB_PROJECT}

.include "../../devel/go-isatty/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../wip/go-color/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
