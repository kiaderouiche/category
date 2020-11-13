# $NetBSD$

GITHUB_PROJECT=	kotlin
DISTNAME=	kotlin-native-linux-1.4.10
PKGNAME=	${DISTNAME:S/-native-linux/-bin/}
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=JetBrains/}
GITHUB_RELEASE=	v1.4.10

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://kotlinlang.org/
COMMENT=	Modern programming language that makes developers happier
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

PKG_JVMS_ACCEPTED=	oracle-jdk8

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/cinterop
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/generate-platform
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/jsinterop
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/klib
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/konan-lldb
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/konanc
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/kotlinc
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/kotlinc-native
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=      -e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		prefix
SUBST_FILES.prefix=	bin/run_konan
SUBST_STAGE.prefix=	post-configure
SUBST_VARS.prefix=	PREFIX
SUBST_SED.prefix+=	-e 's,/usr/bin/env bash,${PREFIX}/bin/bash,g'

SUBST_CLASSES+=		launcher
SUBST_FILES.launcher=	bin/run_konan
SUBST_STAGE.launcher=	post-configure
SUBST_VARS.launcher=	PREFIX
SUBST_SED.launcher+=	-e 's,$JAVA_HOME,${PKG_JAVA_HOME},g'

INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/cinterop ${DESTDIR}${PREFIX}/bin/rcinterop
	${INSTALL_SCRIPT} ${WRKSRC}/bin/generate-platform ${DESTDIR}${PREFIX}/bin/generate-platform
	${INSTALL_SCRIPT} ${WRKSRC}/bin/jsinterop ${DESTDIR}${PREFIX}/bin/jsinterop
	${INSTALL_SCRIPT} ${WRKSRC}/bin/klib ${DESTDIR}${PREFIX}/bin/klib
	${INSTALL_SCRIPT} ${WRKSRC}/bin/konan-lldb ${DESTDIR}${PREFIX}/bin/konan-lldb
	${INSTALL_SCRIPT} ${WRKSRC}/bin/konanc ${DESTDIR}${PREFIX}/bin/konanc
	${INSTALL_SCRIPT} ${WRKSRC}/bin/kotlinc ${DESTDIR}${PREFIX}/bin/kotlinc
	${INSTALL_SCRIPT} ${WRKSRC}/bin/kotlinc-native ${DESTDIR}${PREFIX}/bin/kotlinc-native
	${INSTALL_SCRIPT} ${WRKSRC}/bin/run_konan ${DESTDIR}${PREFIX}/bin/run_konan


.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"

