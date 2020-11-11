# $NetBSD$

DISTNAME=	budgie-desktop-10.5.1
CATEGORIES=	wm
MASTER_SITES=	${MASTER_SITE_GITHUB:=solus-project/budgie-desktop/releases/download/v10.5.1/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/solus-project/budgie-desktop
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v2

USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes

.include "../../devel/meson/build.mk"
.include "../../devel/libpeas/buildlink3.mk"
.include "../../devel/libuuid/buildlink3.mk"
.include "../../devel/libwnck3/buildlink3.mk"
.include "../../inputmethod/ibus/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
