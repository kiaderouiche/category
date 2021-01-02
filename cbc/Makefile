# $NetBSD$

DISTNAME=	Cbc-2.10.5
PKGNAME=	${DISTNAME:tl}
CATEGORIES=	category
MASTER_SITES=	https://www.coin-or.org/download/source/Cbc/
EXTRACT_SUFX=	.tgz

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.coin-or.org/download/source/Cbc/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++ fortran

PKGCONFIG_OVERRIDE+=	Cbc/cbc.pc.in
PKGCONFIG_OVERRIDE+=	Cbc/osi-cbc.pc.in
PKGCONFIG_OVERRIDE+=	Cgl/cgl.pc.in
PKGCONFIG_OVERRIDE+=	Clp/clp.pc.in
PKGCONFIG_OVERRIDE+=	Clp/src/OsiClp/osi-clp.pc.in
PKGCONFIG_OVERRIDE+=	CoinUtils/coinutils.pc.in
PKGCONFIG_OVERRIDE+=	Data/Sample/coindatasample.pc.in
PKGCONFIG_OVERRIDE+=	Data/miplib3/coindatamiplib3.pc.in
PKGCONFIG_OVERRIDE+=	Osi/osi-unittests.pc.in
PKGCONFIG_OVERRIDE+=	Osi/osi.pc.in
PKGCONFIG_OVERRIDE+=	Osi/src/OsiCpx/osi-cplex.pc.in
PKGCONFIG_OVERRIDE+=	Osi/src/OsiGlpk/osi-glpk.pc.in
PKGCONFIG_OVERRIDE+=	Osi/src/OsiGrb/osi-gurobi.pc.in
PKGCONFIG_OVERRIDE+=	Osi/src/OsiMsk/osi-mosek.pc.in
PKGCONFIG_OVERRIDE+=	Osi/src/OsiSpx/osi-soplex.pc.in
PKGCONFIG_OVERRIDE+=	Osi/src/OsiXpr/osi-xpress.pc.in
PKGCONFIG_OVERRIDE+=	ThirdParty/ASL/coinasl.pc.in
PKGCONFIG_OVERRIDE+=	ThirdParty/Blas/coinblas.pc.in
PKGCONFIG_OVERRIDE+=	ThirdParty/Glpk/coinglpk.pc.in
PKGCONFIG_OVERRIDE+=	ThirdParty/Lapack/coinlapack.pc.in
PKGCONFIG_OVERRIDE+=	ThirdParty/Metis/coinmetis.pc.in
PKGCONFIG_OVERRIDE+=	ThirdParty/Mumps/coinmumps.pc.in

.include "../../mk/bsd.pkg.mk"
