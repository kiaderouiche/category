# $NetBSD$

DISTNAME=	speed-20190404
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	speed
GITHUB_TAG=	22ca883d94397b1f6c7a2ab155d9972af6b26813
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=performancecopilot/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/performancecopilot/speed/
COMMENT=	Go implementation of the PCP instrumentation API
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/performancecopilot/${GITHUB_PROJECT}

post-install:
	${RM} -rf ${DESTDIR}${PREFIX}/gopkg/src/${GO_SRCPATH}/vendor

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
