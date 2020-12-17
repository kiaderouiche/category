# $NetBSD$

GITHUB_PROJECT=	PDF4Teachers
DISTNAME=	PDF4Teachers-Linux-1.2.0-BIN
PKGNAME=	${GITHUB_PROJECT:tl}-bin-1.2.0
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_GITHUB:=ClementGre/}
GITHUB_RELEASE=	1.2.0

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ClementGre/PDF4Teachers/
COMMENT=	PDF editing software in large quantities
LICENSE=	apache-2.0

WRKSRC=		${WRKDIR}/pdf4teachers

NO_BUILD=	yes

PKG_JVMS_ACCEPTED=	sun-jdk7 openjdk7 oracle-jdk8 openjdk8

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
