# $NetBSD$

DISTNAME=	dst-0.26.2
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	dst
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=dave/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/dave/dst/
COMMENT=	Decorated Syntax Tree - manipulate Go source with perfect fidelity
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/dave/dst

.include "../../devel/go-mod/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../wip/go-jennifer/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
