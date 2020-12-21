# $NetBSD$

DISTNAME=	package-update-indicator-7
PKGNAME=	package-update-indicator-7.0
CATEGORIES=	sysutils
MASTER_SITES=	https://code.guido-berhoerster.org/projects/package-update-indicator/downloads/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://code.guido-berhoerster.org/projects/package-update-indicator/
COMMENT=	Notify about available software updates
#LICENSE=	# TODO: (see mk/license.mk)

USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		gmake

.include "../../devel/libappindicator/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
