# $NetBSD$

PKGNAME=	${GITHUB_PROJECT}-0.1.0
DISTNAME=	${GITHUB_PROJECT}-${GITHUB_TAG}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=mrtazz/}
GITHUB_PROJECT=	checkmake
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mrtazz/checkmake/
COMMENT=	Experimental linter/analyzer for Makefiles
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/mrtazz/checkmake/

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/bin/mailsend-go ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/docs/mailsend-go.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1

#.include "../../converters/pandoc/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
