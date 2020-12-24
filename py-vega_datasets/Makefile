# $NetBSD$

DISTNAME=	vega_datasets-0.9.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/8f/a0/ce608d9a5b82fce2ebaa2311136b1e1d1dc2807f501bbdfa56bd174fff76/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/altair-viz/vega_datasets
COMMENT=	A Python package for offline access to Vega datasets
LICENSE=	mit

DEPENDS+=	py-pandas>=0:../../math/py-pandas
TEST_DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
