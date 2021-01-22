# $NetBSD$

DISTNAME=	go-fluent-logger-1.5.0
GITHUB_PROJECT=	fluent-logger-golang
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=fluent/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://godoc.org/github.com/fluent/fluent-logger-golang/fluent
COMMENT=	Structured logger for Fluentd
LICENSE=	apache-2.0


GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/fluent/fluent-logger-golang

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
