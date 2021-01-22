# $NetBSD$

DISTNAME=	nats-20210118
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	nats.go
PKGVERSION=	1
GITHUB_TAG=	fccc82d92c534481468f284a93c7e3d57b89ae71
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=nats-io/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/nats-io/nats.go/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/nats-io/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
