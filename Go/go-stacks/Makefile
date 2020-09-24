# $NetBSD$

DISTNAME=	stack-1.8.0
PKGNAME=	go-${DISTNAME}
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-stack/}
CATEGORIES=	devel
GITHUB_TAG=	2fee6af1a9795aafbe0253a0cfbdf668e1fb8a9a
GITHUB_PROJECT=	${PKGBASE:S/^go-//}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/go-stack/stack/
COMMENT=	Stack implements utilities to capture, manipulate, and format call stacks
LICENSE=	mit

WRKSRC=		${WRKDIR}/stack-1.8.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/go-stack/stack/

USE_LANGUAGES=	# none

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
