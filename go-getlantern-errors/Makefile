# $NetBSD$

DISTNAME=	go-getlantern-errors-1.0.1
GITHUB_PROJECT=	errors
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=getlantern/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/getlantern/errors/
COMMENT=	Structured errors for Go 
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/getlantern/errors

.include "../../wip/go-context/buildlink3.mk"
.include "../../wip/go-hidden/buildlink3.mk"
.include "../../wip/go-ops/buildlink3.mk"
.include "../../wip/go-stack/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
