# $NetBSD$

DISTNAME=	go-dupl-1.0.0
GITHUB_PROJECT=	dupl
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=mibk/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mibk/dupl/
COMMENT=	Tool for code clone detection 
LICENSE=	mit

EXTRACT_USING=	bsdtar

GO_SRCPATH=	github.com/mibk/dupl/
GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/bin/dupl ${DESTDIR}${PREFIX}/bin

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
