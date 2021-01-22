# $NetBSD$

DISTNAME=	go-ghw-0.6.1
GITHUB_PROJECT=	ghw
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=jaypipes/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/jaypipes/ghw/
COMMENT=	Golang hardware discovery/inspection library
LICENSE=	apache-2.0

USE_TOOLS+=	bash

GO_SRCPATH=     github.com/jaypipes/ghw
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

REPLACE_BASH+=	hack/run-against-snapshot.sh

.include "../../devel/go-cobra/buildlink3.mk"
.include "../../devel/go-errors/buildlink3.mk"
.include "../../wip/go-pcidb/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
