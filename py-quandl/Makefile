# $NetBSD$

DISTNAME=	Quandl-3.5.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b9/3f/dbe5d8448ea7eb75f079b22d2bdfbb82f6b38e7d6b5e04a5009aff480ffb/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/quandl/quandl-python
COMMENT=	Package for quandl API access
LICENSE=	mit

DEPENDS+=	py-pandas>=0.14:../../math/py-pandas
DEPENDS+=	py-requests>=2.7.0:../../devel/py-requests
DEPENDS+=	py-inflection>=0.3.1:../../textproc/py-inflection
DEPENDS+=	# TODO: python-dateutil>=0
DEPENDS+=	py-six>=0:../../lang/py-six
DEPENDS+=	py-more-itertools>=0:../../devel/py-more-itertools
TEST_DEPENDS+=	py-flake8>=0:../../devel/py-flake8
TEST_DEPENDS+=	py-nose>=0:../../devel/py-nose
TEST_DEPENDS+=	py-httpretty>=0:../../wip/py-httpretty
TEST_DEPENDS+=	py-mock>=0:../../devel/py-mock
TEST_DEPENDS+=	py-factory_boy>=0:../../devel/py-factory_boy
TEST_DEPENDS+=	# TODO: jsondate>=0
TEST_DEPENDS+=	py-parameterized>=0:../../devel/py-parameterized

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.8
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
