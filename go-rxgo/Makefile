# $NetBSD$

DISTNAME=	go-rxgo-2.4.0
GITHUB_PROJECT=	RxGo
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=ReactiveX/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ReactiveX/RxGo/
COMMENT=	TODO: Short description of the package
LICENSE=	mit

GO_SRCPATH=	github.com/ReactiveX/RxGo/
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../devel/go-testify/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
