# $NetBSD$

DISTNAME=	go-jet-6.0.2
GITHUB_PROJECT=	jet
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=CloudyKit/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/CloudyKit/jet/
COMMENT=	Jet template engine
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/CloudyKit/${GITHUB_PROJECT}

.include "../../wip/go-fastprinter/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
