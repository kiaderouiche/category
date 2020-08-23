# $NetBSD$

DISTNAME=	arxiv-0.5.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/7b/c4/f1c53cdff1e8fbd3eba97276a5112745c1cb861bad43fb5b7c5c033159c1/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/lukasschwab/arxiv.py
COMMENT=	Python wrapper for the arXiv API: http://arxiv.org/help/api/
LICENSE=	mit

DEPENDS+=	py-feedparser>=0:../../textproc/py-feedparser
DEPENDS+=	py-requests>=0:../../devel/py-requests
TEST_DEPENDS+=	# TODO: pytest>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
