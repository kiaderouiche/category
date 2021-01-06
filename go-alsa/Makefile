# $NetBSD$

DISTNAME=	alsa-20200611
GITHUB_PROJECT=	alsa
GITHUB_TAG=	d079056f5370c525161fa2ec4b72d0dfd5ef48b8
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=yobert/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/yobert/alsa/
COMMENT=	Golang alsa client implementation 
LICENSE=	mit

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/yobert/${GITHUB_PROJECT

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
