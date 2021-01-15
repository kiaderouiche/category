# $NetBSD$

DISTNAME=	go-tracerr-0.3.0
GITHUB_PROJECT=	tracerr
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=ztrue/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ztrue/tracerr/
COMMENT=	Golang errors with stack trace and source fragments
LICENSE=	mit

GO_DIST_BASE=	tracerr-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/ztrue/tracerr

.include "../../wip/go-aurora/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
