# $NetBSD$

DISTNAME=	go-toolbox-0.33.2
GITHUB_PROJECT=	toolbox
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=viant/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/viant/toolbox/
COMMENT=	Go utility library
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/viant/toolbox

.include "../../devel/go-errors/buildlink3.mk"
.include "../../devel/go-yaml/buildlink3.mk"
.include "../../security/go-crypto/buildlink3.mk"
.include "../../security/go-oauth2/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
