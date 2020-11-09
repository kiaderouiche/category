# $NetBSD$

GITHUB_PROJECT=	kotlin
DISTNAME=	kotlin-native-linux-1.4.10
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=JetBrains/}
GITHUB_RELEASE=	v1.4.10

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/JetBrains/kotlin/
COMMENT=	TODO: Short description of the package
LICENSE=	apache-2.0

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

USE_LANGUAGES=	# none

.include "../../mk/bsd.pkg.mk"
