# $NetBSD$

DISTNAME=	taskctl-1.3.0
GITHUB_PROJECT=	taskctl
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=taskctl/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/taskctl/taskctl/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	https://github.com/taskctl/taskctl

#GO_BUILD_PATTERN=	${GO_SRCPATH}/.

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
