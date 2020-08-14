# $NetBSD$

DISTNAME=	eolie-0.9.99
CATEGORIES=	www python
MASTER_SITES=	https://adishatz.org/eolie/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://adishatz.org/eolie/
COMMENT=	TODO: Short description of the package
LICENSE=	gnu-gpl-v3

USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c
USE_TOOLS+=		pkg-config

PYTHON_VERSIONS_INCOMPATIBLE=	27


#Depends +=       ${PYPKGPREFIX}-sqlite>=1.5.1:../../database/py-sqlite
DEPENDS+=       ${PYPKGPREFIX}-gobject3>=3.36.1:../../devel/py-gobject3
DEPENDS+=       ${PYPKGPREFIX}-dateutil>=2.8.1:../../time/py-dateutil


.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../graphics/py-cairo/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk3+=	gtk3+>=3.0.0
.include "../../x11/gtk3/buildlink3.mk"
.include "../../devel/meson/build.mk"
.include "../../mk/bsd.pkg.mk"
