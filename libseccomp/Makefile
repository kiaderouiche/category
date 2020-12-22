# $NetBSD$

GITHUB_PROJECT=	libseccomp
DISTNAME=	libseccomp-2.5.1
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=seccomp/}
GITHUB_RELEASE=	v2.5.1

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/seccomp/libseccomp/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	libseccomp.pc.in

.include "../../mk/bsd.pkg.mk"
