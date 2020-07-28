# $NetBSD$

DISTNAME=	resonance-0.22.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f9/e9/04628aa8a4feb2c177539e347b7139fcbafdc7da9958fb5a392bdd6481d5/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/moorepants/resonance/
COMMENT=	Learning mechanical vibrations through computation
LICENSE=	mit

DEPENDS+=	py-matplotlib>=2.1:../../graphics/py-matplotlib
DEPENDS+=	py-scipy>=0.19:../../math/py-scipy
DEPENDS+=	py-pandas>=0.17:../../math/py-pandas

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.13
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
