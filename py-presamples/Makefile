# $NetBSD$

DISTNAME=	presamples-0.2.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/06/29/bd19f1cba3c0c11e35d52dcfe9410568774a3fa0cea42d3609e08800759c/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/PascalLesage/presamples
COMMENT=	Package to write, load, manage and verify numerical arrays, called presamples
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-bw2calc>=0:../../category/py-bw2calc
DEPENDS+=	py-bw2data>=0:../../category/py-bw2data
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-peewee>=0:../../databases/py-peewee
DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: stats_arrays>=0
DEPENDS+=	py-wrapt>=0:../../devel/py-wrapt

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
