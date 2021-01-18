# $NetBSD$

DISTNAME=	go-log15-2.15
GITHUB_PROJECT=	log15
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=inconshreveable/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/inconshreveable/log15/
COMMENT=	Structured, composable logging for Go
LICENSE=	apache-2.0

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/inconshreveable/${GITHUB_PROJECT}

.include "../../devel/go-colorable/buildlink3.mk"
.include "../../devel/go-isatty/buildlink3.mk"
.include "../../wip/go-stack/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
