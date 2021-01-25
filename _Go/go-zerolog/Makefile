# $NetBSD$

DISTNAME=	zerolog-20210120
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	zerolog
GITHUB_TAG=	a8f5328bb7c784b044cc9649643d56d97ad2334c
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=rs/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/rs/zerolog/
COMMENT=	Zero Allocation JSON Logger
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/zerolog/${GITHUB_PROJECT}

.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../wip/go-xid/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
