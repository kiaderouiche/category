# $NetBSD$

GITHUB_PROJECT=	kleopatra
GITHUB_TAG=	v20.08.2
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=KDE/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/KDE/kleopatra/
COMMENT=	Certificate manager and GUI for OpenPGP and CMS cryptography
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/kleopatra-20.08.2

BUILD_DEPENDS+= kdoctools>=5.19.0:../../devel/kdoctools
DEPENDS+=	paperkey>=:../../security/paperkey

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../devel/boost-headers/buildlink3.mk"
.include "../../mail/kmime/buildlink3.mk"
BUILDLINK_API_DEPENDS.gpgme+=	gpgme>=0.9.0
.include "../../security/gpgme/buildlink3.mk"
.include "../../security/qgpgme/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
