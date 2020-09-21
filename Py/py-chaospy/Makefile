# $NetBSD$

DISTNAME=	chaospy-3.3.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/15/fc/4d58fe51ba5b32b57c175b1a377277c358b4553303cc04fd8a377346da36/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/jonathf/chaospy
COMMENT=	Numerical tool for perfroming uncertainty quantification
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: numpoly==1.0.6>=0
DEPENDS+=	py-scipy>=0:../../math/py-scipy

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
