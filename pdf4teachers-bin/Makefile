# $NetBSD$

GITHUB_PROJECT=	PDF4Teachers
DISTNAME=	PDF4Teachers-Linux-1.2.0-BIN
PKGNAME=	${GITHUB_PROJECT:tl}-bin-1.2.0
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_GITHUB:=ClementGre/}
GITHUB_RELEASE=	1.2.0

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ClementGre/PDF4Teachers/
COMMENT=	PDF editing software in large quantities
LICENSE=	apache-2.0

WRKSRC=		${WRKDIR}/pdf4teachers

ONLY_FOR_PLATFORM=	NetBSD-*-i386 Linux-*-*

USE_TOOLS+= bash pax
NO_BUILD=	yes

PKG_JVMS_ACCEPTED=	sun-jdk7 openjdk7 oracle-jdk8 openjdk8

PDF4Teachers_HOME=	${PREFIX}/opt/pdf4teachers

INSTALLATION_DIRS=	bin  share/applications PDF4Teachers_HOME

post-extract:
	${RM}	${WRKSRC}/pdf4teachers/bin/PDF4Teachers.bat

#do-install:
  #NONE

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
