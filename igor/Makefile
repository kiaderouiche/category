# $NetBSD$

DISTNAME=	igor
PKGNAME=	igor-1.4.0
GITHUB_PROJECT=	IGoR
GITHUB_TAG=	refs/tags/1.4.0
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=qmarcou/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/qmarcou/IGoR/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/IGoR-1.4.0
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	libs/gsl_sub/gsl.pc.in
PKGCONFIG_OVERRIDE+=	libs/jemalloc/jemalloc.pc.in

.include "../../mk/bsd.pkg.mk"
