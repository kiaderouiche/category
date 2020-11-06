# $NetBSD$

GITHUB_PROJECT=	ukui-settings-daemon
GITHUB_TAG=	v1.1.7
DISTNAME=	v1.1.7
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=ukui/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ukui/ukui-settings-daemon/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/ukui-settings-daemon-1.1.7
USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes

PKGCONFIG_OVERRIDE+=	data/ukui-settings-daemon.pc.in

.include "../../mk/bsd.pkg.mk"
