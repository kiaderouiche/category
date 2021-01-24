# $NetBSD$

DISTNAME=	go-svu-1.2.0
GITHUB_PROJECT=	svu
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=caarlos0/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/caarlos0/svu/
COMMENT=	Semantic Version Util 
LICENSE=	mit

GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/caarlos0/svu/

.include "../../devel/go-kingpin.v3-unstable/buildlink3.mk"
.include "../../wip/go-semver/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
