# $NetBSD$

DISTNAME=	gsettings-desktop-schemas-3.38.0
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/gsettings-desktop-schemas/3.38/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://download.gnome.org/sources/gsettings-desktop-schemas/3.38/ # TODO: check
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_TOOLS+=		msgfmt pkg-config
USE_PKGLOCALEDIR=	yes

PKGCONFIG_OVERRIDE+=	gsettings-desktop-schemas.pc.in

.include "../../devel/glib2/schemas.mk"                                       
BUILDLINK_DEPMETHOD.gobject-introspection:=     build                         
BUILDLINK_API_DEPENDS.gobject-introspection+=   gobject-introspection>=1.31   
.include "../../devel/gobject-introspection/buildlink3.mk"                    
.include "../../lang/python/tool.mk"
.include "../../devel/meson/build.mk"
.include "../../mk/bsd.pkg.mk"
