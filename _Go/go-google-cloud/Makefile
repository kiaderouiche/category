# $NetBSD$

DISTNAME=	go-google-cloud-0.75.0
GITHUB_PROJECT=	google-cloud-go
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=googleapis/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/googleapis/google-cloud-go/
COMMENT=	Google Cloud Client Libraries for Go
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/googleapis/google-cloud-go

.include "../../devel/go-sync/buildlink3.mk"
.include "../../devel/go-xerrors/buildlink3.mk"
.include "../../wip/go-uuid/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
