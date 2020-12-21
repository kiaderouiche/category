# $NetBSD$

DISTNAME=	budgie-desktop-v10.5.2
PKGNAME=	${DISTNAME:S,-v,-,}
CATEGORIES=	wm
MASTER_SITES=	${MASTER_SITE_GITHUB:=solus-project/budgie-desktop/releases/download/v10.5.2/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://solus-project.com/
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v2

WRKSRC=			${WRKDIR}/budgie-desktop-10.5.2

USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes

.include "../../devel/libpeas/buildlink3.mk" 
.include "../../devel/libuuid/buildlink3.mk" 
.include "../../devel/meson/build.mk"
BUILDLINK_API_DEPENDS.vala+=    vala>=0.48                                    
.include "../../lang/vala/buildlink3.mk"   
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
