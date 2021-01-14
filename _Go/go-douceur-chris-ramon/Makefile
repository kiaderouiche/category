# $NetBSD$

DISTNAME=	douceur-chris-ramon-20160604
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	douceur
GITHUB_TAG=	f3463056cd52886eda904655e1940157bf323bd7
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=chris-ramon/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/chris-ramon/douceur/
COMMENT=	Simple CSS parser and inliner in Go 
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	https://github.com/chris-ramon/douceur

.include "../../net/go-net/buildlink3.mk"
.include "../../wip/go-cascadia/buildlink3.mk"
.include "../../wip/go-goquery/buildlink3.mk"
.include "../../wip/go-gorilla-css/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
