# $NetBSD$

DISTNAME=	go-machineid-1.0.1
GITHUB_PROJECT=	machineid
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=denisbrodbeck/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/denisbrodbeck/machineid/
COMMENT=	Get the unique machine id of any host
LICENSE=	mit

GO_SRCPATH=	github.com/denisbrodbeck/machineid
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
