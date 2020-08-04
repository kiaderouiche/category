# $NetBSD$

DISTNAME=	mystic-0.3.6
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/2a/b2/41d3503725a7fe223a8082b330dad5ebeeb352ca36f0d15a5b00d5bcdc45/
EXTRACT_SUFX=	.zip

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://pypi.org/project/mystic
COMMENT=	highly-constrained non-convex optimization and uncertainty quantification
#LICENSE=	3-clause BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-sympy>=0.6.7:../../math/py-sympy
DEPENDS+=	# TODO: klepto>=0.1.9
DEPENDS+=	# TODO: dill>=0.3.2

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
