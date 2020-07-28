# $NetBSD$

DISTNAME=	funsor-0.1.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/65/3c/7409f1cd07797ba0f059127535c5f8288c14acfaf508ef90643b92cb92c0/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/pyro-ppl/funsor
COMMENT=	A tensor-like library for functions and distributions
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-flake8>=0:../../devel/py-flake8
BUILD_DEPENDS+=	py-isort>=0:../../devel/py-isort
BUILD_DEPENDS+=	py-pandas>=0:../../math/py-pandas
BUILD_DEPENDS+=	# TODO: pytest-xdist==1.27.0>=0
BUILD_DEPENDS+=	py-sphinx>=2.0:../../textproc/py-sphinx
BUILD_DEPENDS+=	# TODO: sphinx_rtd_theme>=0
BUILD_DEPENDS+=	# TODO: torchvision==0.2.1>=0
DEPENDS+=	py-multipledispatch>=0:../../devel/py-multipledispatch
DEPENDS+=	# TODO: opt_einsum>=2.3.2
DEPENDS+=	# TODO: pyro-ppl>=0.5
DEPENDS+=	# TODO: pytest>=4.1
DEPENDS+=	# TODO: torch>=1.3.0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.7
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
