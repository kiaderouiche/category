# $NetBSD$

DISTNAME=	budgie-desktop_10.5.orig
CATEGORIES=	wm
MASTER_SITES=	http://deb.debian.org/debian/pool/main/b/budgie-desktop/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://deb.debian.org/debian/pool/main/b/budgie-desktop/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/budgie-desktop-10.5
USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes

DEPEDNS+=	sassc>=3.6.1:../../www/sassc

BUILDLINK_API_DEPENDS.alsa-lib+=	alsa-lib>=1.0.18
.include "../../audio/alsa-lib/buildlink3.mk"
BUILDLINK_API_DEPENDS.pulseaudio+=	pulseaudio>=13.0
.include "../../audio/pulseaudio/buildlink3.mk"
.include "../../devel/meson/build.mk"
.include "../../devel/libpeas/buildlink3.mk"
.include "../../devel/libwnck3/buildlink3.mk"
.include "../../inputmethod/ibus/buildlink3.mk"
BUILDLINK_API_DEPENDS.vala+=	vala>=0.48
.include "../../lang/vala/buildlink3.mk"
BUILDLINK_API_DEPENDS.accountsservice+=	accountsservice>=0.6.40
.include "../../sysutils/accountsservice/buildlink3.mk"
.include "../../sysutils/libnotify/buildlink3.mk"
BUILDLINK_API_DEPENDS.gnome-desktop3+=	gnome-desktop3>=3.4.2
.include "../../x11/gnome-desktop3/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
