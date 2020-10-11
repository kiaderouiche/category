# $NetBSD$

DISTNAME=	hug-2.6.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/9e/b2/0549ffd2f6bdeb37e5cbee7119830e0928ca0df12c16ab8ed68078c69239/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/hugapi/hug
COMMENT=	A Python framework that makes developing APIs as simple as possible, but no simpler
LICENSE=	mit

BUILD_DEPENDS+=	# TODO: pytest-runner>=0
DEPENDS+=	py-falcon>=0:../../devel/py-falcon
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	# TODO: falcon==2.0.0>=0
DEPENDS+=	py-requests>=0:../../devel/py-requests
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	py-mock>=0:../../devel/py-mock
TEST_DEPENDS+=	py-marshmallow>=0:../../wip/py-marshmallow

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
