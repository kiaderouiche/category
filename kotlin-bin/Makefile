# $NetBSD$

GITHUB_PROJECT=	kotlin
DISTNAME=	kotlin-native-linux-1.4.10
PKGNAME=	${DISTNAME:S/-native-linux/-bin/}
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=JetBrains/}
GITHUB_RELEASE=	v1.4.10

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://kotlinlang.org/
COMMENT=	Statically typed programming language that can interoperate with Java
LICENSE=	apache-2.0

USE_LANGUAGES=	# empty
NO_BUILD=	yes

USE_TOOLS+=	bash pax

REPLACE_BASH+=	bin/cinterop 		\
		bin/jsinterop 		\
		bin/konan-lldb		\
		bin/generate-platform	\
		bin/klib		\
		bin/konanc		\
		bin/kotlinc		\
		bin/kotlinc-native	\
		run_konan

#REPLACE_PYTHON+=	tools/konan_lldb.py

PKG_JVMS_ACCEPTED=	sun-jdk7 openjdk7 oracle-jdk8 openjdk8

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix+=	bin/cinterop
SUBST_FILES.prefix+=	bin/generate-platform
SUBST_FILES.prefix+=	bin/jsinterop
SUBST_FILES.prefix+=	bin/konan-lldb
SUBST_FILES.prefix+=	bin/konanc
SUBST_FILES.prefix+=	bin/klib
SUBST_FILES.prefix+=	bin/konanc
SUBST_FILES.prefix+=	bin/kotlinc-native
SUBST_FILES.prefix+=	bin/run_konan
SUBST_STAGE.prefix=	pre-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'
SUBST_MESSAGE.paths=	Fixing header search paths.

AUTO_MKDIRS=	yes

SHAREDIR=		${PREFIX}/share/${PKGBASE}/licenses
INSTALLATION_DIRS=	bin SHAREDIR

do-install:
	${RUN} ${INSTALL_DATA_DIR}	${DESTDIR}${SHAREDIR}
	cd ${WRKSRC}/licenses && pax -rw -pp * ${DESTDIR}${SHAREDIR}
#.for ff in cinterop generate-platform jsinterop klib konan-lldb konanc kotlinc kotlinc-native run_konan
#	${INSTALL_SCRIPT} ${WRKSRC}/bin/${ff} ${DESTDIR}${PREFIX}/bin/${ff}
#.endfor


.include "../../lang/python/application.mk"
.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
