# $NetBSD$

DISTNAME=	eight2-0.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ce/dd/e7ebe9b1adffa54ca0c8155777339536e5899ae86e9f6d1727d907847b50/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/bopo/eight2
COMMENT=	Python Boilerplate contains all the boilerplate you need to create a Python package
LICENSE=	mit

BUILD_DEPENDS+=	# TODO: pytest-runner>=0
DEPENDS+=	py-tzlocal>=0:../../time/py-tzlocal
DEPENDS+=	py-jinja2>=0:../../textproc/py-jinja2
DEPENDS+=	py-arrow>=0:../../time/py-arrow
DEPENDS+=	# TODO: sxtwl>=0
DEPENDS+=	py-click>=0:../../devel/py-click
TEST_DEPENDS+=	# TODO: pytest>=3

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
