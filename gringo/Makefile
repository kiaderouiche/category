# $NetBSD$

DISTNAME=	gringo-4.5.4-source
PKGNAME=	${DISTNAME:S/-source//}
CATEGORIES=	devel
MASTER_SITES=	https://master.dl.sourceforge.net/project/potassco/gringo/4.5.4/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://master.dl.sourceforge.net/project/potassco/gringo/4.5.4/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_TOOLS+=	bison
USE_LANGUAGES=	c++

DEPENDS+=	re2c>=2.0.3:../../devel/re2c

.include "../../devel/scons/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
