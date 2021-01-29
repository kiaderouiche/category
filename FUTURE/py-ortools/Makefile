# $NetBSD$

DISTNAME=	ortools-8.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT=	or-tools
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=google/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://developers.google.com/optimization/
COMMENT=	TODO: Short description of the package
LICENSE=	apache-2.0

WRKSRC=		${WRKDIR}/or-tools-8.1

USE_CMAKE=	yes
USE_LANGUAGES=	c++
USE_TOOLS+=	gmake

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
