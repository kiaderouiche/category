# $NetBSD$

DISTNAME=	go-golog-20201105
GITHUB_PROJECT=	golog
GITHUB_TAG=	9586b8bde3a95f71c84d9ee2a1a3f778759a76ab
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=getlantern/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/getlantern/golog
COMMENT=	Really basic logging mostly for flashlight
LICENSE=	apache-2.0

GO_SRCPATH=	github.com/getlantern/golog
GO_DIST_BASE=	golog-${GITHUB_TAG}

.include "../../wip/go-hidden/buildlink3.mk"
.include "../../wip/go-bpool/buildlink3.mk"
.include "../../wip/go-ops/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
