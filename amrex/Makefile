# $NetBSD$

GITHUB_PROJECT=	amrex
GITHUB_TAG=	20.09
DISTNAME=	20.09
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=AMReX-Codes/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://amrex-codes.github.io/
COMMENT=	Block-Structured AMR Software Framework and Applications
LICENSE=	modified-bsd

WRKSRC=		${WRKDIR}/amrex-20.09

HAS_CONFIGURE=	yes
USE_CMAKE=	yes
USE_LANGUAGES=	c c++ fortran

REPLACE_PYTHON+=	Tools/libamrex/configure.py
REPLACE_PYTHON+=	Tools/C_scripts/describe_sources.py
REPLACE_PYTHON+=	Tools/C_scripts/makebuildinfo_C.py
REPLACE_PYTHON+=	Tools/typechecker/typechecker.py
REPLACE_PERL+=		Tools/C_scripts/mkdep
REPLACE_PERL+=		Tools/C_scripts/strip72

#Sample portage

.include "../../lang/python/application.mk"
.include "../../mk/mpi.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
