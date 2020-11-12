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

BUILDLINK_API_DEPENDS.alsa-lib+=        alsa-lib>=1.0.18
.include "../../audio/alsa-lib/buildlink3.mk"
BUILDLINK_API_DEPENDS.pulseaudio+=      pulseaudio>=13.0                      
.include "../../audio/pulseaudio/buildlink3.mk"                               
.include "../../devel/libpeas/buildlink3.mk"                                  
.include "../../devel/libuuid/buildlink3.mk"                                  
.include "../../devel/libwnck3/buildlink3.mk"                                 
.include "../../inputmethod/ibus/buildlink3.mk"                               
BUILDLINK_API_DEPENDS.vala+=    vala>=0.48                                    
.include "../../lang/vala/buildlink3.mk"                                      
.include "../../security/polkit/buildlink3.mk"                                
BUILDLINK_API_DEPENDS.accountsservice+= accountsservice>=0.6.40               
.include "../../sysutils/accountsservice/buildlink3.mk"                       
BUILDLINK_API_DEPENDS.gsettings-desktop-schemas+=       gsettings-desktop-schemas>=3.36.1
.include "../../wip/gsettings-desktop-schemas/buildlink3.mk"
.include "../../sysutils/libnotify/buildlink3.mk"                             
BUILDLINK_API_DEPENDS.gnome-desktop3+=  gnome-desktop3>=3.4.2                 
.include "../../x11/gnome-desktop3/buildlink3.mk"
.include "../../devel/meson/build.mk"
.include "../../x11/gtk3/buildlink3.mk"
BUILDLINK_API_DEPENDS.mutter+=  mutter>=3.36.3
.include "../../wm/mutter/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
