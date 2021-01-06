# $NetBSD$

DISTNAME=	aru-0.9
CATEGORIES=	math
MASTER_SITES=	https://aru.hepforge.org/downloads/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://aru.hepforge.org/downloads/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

DEPENDS+=	root>=5.26:../../misc/root

.include "../../devel/swig2/buildlink3.mk"
.include "../../math/nlopt/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
