# $NetBSD$

DISTNAME=	go-multierr-1.6.0
GITHUB_PROJECT=	multierr
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=uber-go/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://go.uber.org/multierr
COMMENT=	Combine one or more Go errors together 
LICENSE=	mit

GO_SRCPATH=	github.com/uber-go/multierr/
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
