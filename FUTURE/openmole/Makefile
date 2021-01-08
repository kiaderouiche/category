# $NetBSD$

DISTNAME=	openmole
PKGNAME=	${DISTNAME}-${VERSION}
CATEGORIES=	math
MASTER_SITES=	https://openmole.org/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://openmole.org/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_LANGUAGES=	# none

USE_TOOLS+=	bash pax
NO_BUILD=	yes

VERSION=	10

PKG_JVMS_ACCEPTED=	sun-jdk7 openjdk7 oracle-jdk8 openjdk8

.include "../../mk/java-env.mk"
.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
