# $NetBSD$

DISTNAME=	dist-20190702
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go-dist
GITHUB_TAG=	2acdd84d3dfb194bb39f6e0582dd4de9668303eb
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=200sc/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/200sc/go-dist/
COMMENT=	Interface types for distributions over integers and floats
LICENSE=	mit

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/200sc/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
