# $NetBSD$

DISTNAME=	factor-src-0.98
PKGNAME=	${DISTNAME:S/-src//}
CATEGORIES=	lang
MASTER_SITES=	https://downloads.factorcode.org/releases/0.98/
EXTRACT_SUFX=	.zip

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://factorcode.org/
COMMENT=	TODO: Short description of the package
LICENSE=	modified-bsd

WRKSRC=		${WRKDIR}/factor

USE_TOOLS+=	bash
USE_LANGUAGES=	c c++

MAKE_FILE=	GNUmakefile

.include "../../mk/bsd.pkg.mk"
