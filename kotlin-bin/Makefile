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

USE_TOOLS+=	bash

REPLACE_BASH+=	bin/cinterop 		\
		bin/jsinterop 		\
		bin/konan-lldb		\
		bin/generate-platform	\
		bin/klib		\
		bin/konanc		\
		bin/kotlinc		\
		bin/kotlinc-native	\
		run_konan

#USE_JAVA=	run
PKG_JVMS_ACCEPTED=	oracle-jdk8
#USE_JAVA2=	8

INSTALLATION_DIRS=	bin

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
