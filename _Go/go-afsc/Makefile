# $NetBSD$

DISTNAME=	go-afsc-1.3.0
GITHUB_PROJECT=	afsc
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=viant/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/viant/afsc/
COMMENT=	Abstract File Storage Connectors
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/viant/afsc

.include "../../devel/go-errors/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
