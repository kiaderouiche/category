# $NetBSD$

DISTNAME=	ppscore-1.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f7/25/5d7bc56240da13ef3be08ca4b6c61747d3ca3f8db649e67d97016a0629c8/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://files.pythonhosted.org/packages/f7/25/5d7bc56240da13ef3be08ca4b6c61747d3ca3f8db649e67d97016a0629c8/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-pandas>=1.0.0,<2.0.0:../../math/py-pandas
DEPENDS+=	py-scikit-learn>=0.20.2,<1.0.0:../../math/py-scikit-learn

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
