# $NetBSD$

DISTNAME=	ginkgo-20210119
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	ginkgo
GITHUB_TAG=	c2b0e168fabb7e9568955ff92a8b57ccc0258af1
PKGVERSION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=onsi/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/onsi/ginkgo/
COMMENT=	BDD Testing Framework for Go
LICENSE=	mit

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/onsi/ginkgo

.include "../../devel/go-tools/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
