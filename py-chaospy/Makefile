# $NetBSD$

DISTNAME=	chaospy-3.3.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/15/fc/4d58fe51ba5b32b57c175b1a377277c358b4553303cc04fd8a377346da36/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/jonathf/chaospy
COMMENT=	Numerical tool for perfroming uncertainty quantification
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: numpoly==1.0.6>=0
DEPENDS+=	${PYPKGPREFIX}-scipy>=0:../../math/py-scipy

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
