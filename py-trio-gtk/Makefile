# $NetBSD$

DISTNAME=	trio-gtk-3.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/c8/df/8c8bf5821c5d420fda571a9e301e8c8be2b21f3fa3afeea3e01e8d022323/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/decentral1se/trio-gtk
COMMENT=	Trio guest mode wrapper for PyGTK
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	# TODO: pycairo<1.20>=0
DEPENDS+=	# TODO: pygobject<3.32>=0
DEPENDS+=	py-trio>=0.17.0,<0.18.0:../../category/py-trio

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
