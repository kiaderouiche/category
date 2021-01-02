# $NetBSD$

DISTNAME=	eclipse-testing-2020-12-R-linux-gtk-x86_64
PKGNAME=	${DISTNAME:S/-R-linux-gtk-x86_64//}
CATEGORIES=	devel java
MASTER_SITES=	http://mirror.ufs.ac.za/eclipse/technology/epp/downloads/release/2020-12/R/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/eclipse

 USE_TOOLS+=	pax
NO_BUILD=		yes

PKG_JVMS_ACCEPTED=	sun-jdk7 sun-jdk8

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
