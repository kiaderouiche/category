# $NetBSD$

DISTNAME=	flexiblesusy-2.5.0
GITHUB_PROJECT=	FlexibleSUSY
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=FlexibleSUSY/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://flexiblesusy.hepforge.org/
COMMENT=	Creates spectrum generators for supersymmetric/non-supersymmetric models
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/FlexibleSUSY-2.5.0

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c++ fortran

#C++ compiler (g++ >= 5.0.0 or clang++ >= 3.8.1 or icpc >= 17.0.0)

.include "../../mk/bsd.pkg.mk"
