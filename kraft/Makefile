# $NetBSD$

GITHUB_PROJECT=	kraft
GITHUB_TAG=	v0.95
DISTNAME=	v0.95
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	finance
MASTER_SITES=	${MASTER_SITE_GITHUB:=dragotin/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://volle-kraft-voraus.de/
COMMENT=	Manage invoices and documents for small companies
LICENSE=	gnu-gpl-v2

WRKSRC=			${WRKDIR}/kraft-0.95

USE_CMAKE=		yes
USE_TOOLS+=		msgmerge
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

.include "../../devel/grantlee-qt5/buildlink3.mk"
.include "../../wip/akonadi/buildlink3.mk"
.include "../../wip/akonadi-contacts/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
