# $NetBSD$

DISTNAME=	RxPy3-1.0.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/cd/ca/122f3c2fa1e4a0f809e461e5d5d39d2000b80ba87534a971771bded9630d/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://reactivex.io
COMMENT=	Reactive Extensions (Rx) for Python, aliased for Rx3
LICENSE=	mit

TEST_DEPENDS+=	# TODO: pytest>=4.6.1
TEST_DEPENDS+=	# TODO: pytest-asyncio>=0.10.0
TEST_DEPENDS+=	py-coverage>=4.5.3:../../devel/py-coverage

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
