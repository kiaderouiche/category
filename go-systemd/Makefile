# $NetBSD$

DISTNAME=	go-systemd-22.1.0
GITHUB_PROJECT=	go-systemd
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=coreos/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/coreos/go-systemd/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_TOOLS+=	bash

GO_DIST_BASE=	systemd-${GITHUB_TAG}
GO_SRCPATH=	github.com/coreos/go-systemd

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
