# $NetBSD$

GITHUB_PROJECT=	ukui-wallpapers
GITHUB_TAG=	v20.04.2
DISTNAME=	v20.04.2
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=ukui/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ukui/ukui-wallpapers/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/ukui-wallpapers-20.04.2
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		# none

.include "../../devel/meson/build.mk"
.include "../../mk/bsd.pkg.mk"
