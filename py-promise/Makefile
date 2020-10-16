# $NetBSD$

GITHUB_PROJECT=	promise
GITHUB_TAG=	v2.3.0
DISTNAME=	v2.3.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GITHUB:=syrusakbary/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/syrusakbary/promise
COMMENT=	Promises/A+ implementation for Python
LICENSE=	mit

DEPENDS+=	py-typing>=3.6.4;python_version<'3.5':../../devel/py-typing
DEPENDS+=	py-six>=0:../../lang/py-six
TEST_DEPENDS+=	# TODO: pytest>=2.7.3
TEST_DEPENDS+=	# TODO: pytest-cov>=0
TEST_DEPENDS+=	py-coveralls>=0:../../wip/py-coveralls
TEST_DEPENDS+=	py-futures>=0:../../devel/py-futures
TEST_DEPENDS+=	# TODO: pytest-benchmark>=0
TEST_DEPENDS+=	py-mock>=0:../../devel/py-mock
TEST_DEPENDS+=	# TODO: pytest-asyncio>=0

WRKSRC=		${WRKDIR}/promise-2.3.0
USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
