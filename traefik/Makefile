# $NetBSD$

GITHUB_PROJECT=	traefik
DISTNAME=	traefik-v1.7.28.src
PKGNAME=	${DISTNAME:S,-v,-,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=traefik/}
GITHUB_RELEASE=	v1.7.28

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/traefik/traefik/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR} # TODO: one of docs server cmd healthcheck examples rules provider metrics contrib vendor collector integration middlewares job testhelpers tls whitelist static script api configuration version acme autogen webui templates h2c ping safe log types cluster hostresolver anonymize, or leave it as-is
USE_TOOLS+=	gmake

.include "../../mk/bsd.pkg.mk"
