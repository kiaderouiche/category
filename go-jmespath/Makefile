# $NetBSD$

DISTNAME=	go-jmespath-0.4.0
GITHUB_PROJECT=	go-jmespath
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=jmespath/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/jmespath/go-jmespath/
COMMENT=	Golang implementation of JMESPath
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/jmespath/go-jmespath

.include "../../devel/go-yaml/buildlink3.mk"
.include "../../textproc/go-spew/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
