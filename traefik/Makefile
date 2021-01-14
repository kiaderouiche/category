# $NetBSD$

GITHUB_PROJECT=	traefik
DISTNAME=	traefik-v2.3.6.src
PKGNAME=	${DISTNAME:S,-v,-,:S/.src//}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=traefik/}
GITHUB_RELEASE=	v2.3.6

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/traefik/traefik/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}

USE_TOOLS+=	bash gmake
USE_LANGUAGES=	# none

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
