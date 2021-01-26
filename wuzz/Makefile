# $NetBSD$

DISTNAME=	wuzz-0.5.0
GITHUB_PROJECT=	wuzz
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=asciimoo/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/asciimoo/wuzz/
COMMENT=	Interactive cli tool for HTTP inspection
LICENSE=	gnu-lgpl-v3

.include "go-modules.mk"

GO_BUILD_PATTERN=	.

.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
