# $NetBSD$

DISTNAME=	go-sciter-20201129
GITHUB_PROJECT=	go-sciter
GITHUB_TAG=	ec87e3d
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=sciter-sdk/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/sciter-sdk/go-sciter/
COMMENT=	Embeddable HTML/CSS/script engine for modern UI development
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}*
GO_SRCPATH=     github.com/sciter-sdk/go-sciter

.include "../../wip/go-rice/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
