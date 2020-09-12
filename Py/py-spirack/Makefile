# $NetBSD$

DISTNAME=	spirack-0.2.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/d6/ae/fca118f737dc653edde86958fa63f68865e8f0320a213d8ab7e12781ecb5/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/mtiggelman/SPI-rack
COMMENT=	Drivers for the QuTech SPI-rack
LICENSE=	mit

DEPENDS+=	# TODO: pyserial>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
