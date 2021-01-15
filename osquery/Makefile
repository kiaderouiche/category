# $NetBSD$

DISTNAME=	go-osquery-4.6.0
GITHUB_PROJECT=	osquery
GITHUB_TAG=	${PKGVERSION_NOREV}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=osquery/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/osquery/osquery/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/osquery/osquery

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
