# $NetBSD$

DISTNAME=	ukui-settings-daemon_1.1.6.orig
CATEGORIES=	category
MASTER_SITES=	http://deb.debian.org/debian/pool/main/u/ukui-settings-daemon/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://deb.debian.org/debian/pool/main/u/ukui-settings-daemon/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/ukui-settings-daemon
USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes

PKGCONFIG_OVERRIDE+=	data/ukui-settings-daemon.pc.in

.include "../../mk/bsd.pkg.mk"
