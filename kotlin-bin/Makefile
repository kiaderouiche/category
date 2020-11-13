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

SUBST_CLASSES+=		launcher
SUBST_FILES.launcher=	bin/run_konan
SUBST_STAGE.launcher=	post-configure
SUBST_VARS.launcher=	PREFIX
SUBST_SED.launcher+=	-e 's,JAVA_HOME,${PKG_JAVA_HOME},g'

INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/run_konan ${DESTDIR}${PREFIX}/bin/run_konan

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
