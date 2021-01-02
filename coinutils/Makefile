# $NetBSD$

DISTNAME=	coinutils-2.11.4
GITHUB_PROJECT=	CoinUtils
GITHUB_TAG=	f709081c9b57cc2dd32579d804b30689ca789982
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=coin-or/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/coin-or/CoinUtils/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/CoinUtils-f709081c9b57cc2dd32579d804b30689ca789982

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++ fortran

PKGCONFIG_OVERRIDE+=	CoinUtils/coinutils.pc.in

.include "../../mk/bsd.pkg.mk"
