# $NetBSD$

DISTNAME=	Jmol-14.31.20-binary
PKGNAME=	${DISTNAME:S/J/j/S/-binary//}
CATEGORIES=	biology java
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=jmol/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	http://jmol.sourceforge.net/
COMMENT=	Open-source Java viewer for chemical structures in 3D
LICENSE=	gnu-lgpl-v2.1

WRKSRC=		${WRKDIR}/jmol-14.31.20

ONLY_FOR_PLATFORM=	NetBSD-*-i386 Linux-*-*

USE_LANGUAGES=	# none

PKG_JVMS_ACCEPTED=	sun-jdk7 openjdk7 oracle-jdk8 openjdk8

JMOL_HOME=	${PREFIX}/share/jmol
JMOL_FILES=	Jmol.jar JmolApplet.jar           	    \
			JmolApplet0.jar 		    \
			JmolApplet0_*.jar	            \
			JmolAppletSigned0_*.jar	    	    \
			JmolData.jar Jmol.js

do-install:
  ${INSTALL_SCRIPT}  ${WRKSRC}/jmol.sh ${DESTDIR}${PREFIX}/bin/jmol
.for  j in ${JMOL_FILES}
	${INSTALL_DATA} ${WRKSRC}/${j}  ${DESTDIR}${JMOL_HOME}
.endfor

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
