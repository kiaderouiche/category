# $NetBSD$

DISTNAME=	go-gobot-1.15.0
GITHUB_PROJECT=	gobot
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=hybridgroup/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/hybridgroup/gobot/
COMMENT=	Golang framework for robotics, drones, and the Internet of Things
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=	github.com/hybridgroup/gobot/
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

USE_TOOLS+=	gmake

.include "../../devel/go-cli/buildlink3.mk"
.include "../../devel/go-errors/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
