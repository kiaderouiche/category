# $NetBSD$

GITHUB_PROJECT=	go-metrics
GITHUB_TAG=	v0.3.4
DISTNAME=	v0.3.4
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=armon/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/armon/go-metrics/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/go-metrics-0.3.4

USE_LANGUAGES=	# none

.include "../../devel/go-immutable-radix/buildlink3.mk"
.include "../../devel/go-golang-lru/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
