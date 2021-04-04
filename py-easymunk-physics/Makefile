# $NetBSD$

DISTNAME=	easymunk-physics-0.9.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f0/7a/d6beaf4e6fe472176c98666fc38a32de2ffdcda6b516f7e7a48eaf28fbf7/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://fabiommendes.github.io/easymunk/
COMMENT=	Easymunk is a easy-to-use pythonic 2d physics library
LICENSE=	mit

BUILD_DEPENDS+=	# TODO: pytest>=0
BUILD_DEPENDS+=	# TODO: pytest-cov>=0
BUILD_DEPENDS+=	# TODO: pytest-mock>=0
BUILD_DEPENDS+=	py-hypothesis>=0:../../devel/py-hypothesis
BUILD_DEPENDS+=	py-black>=0:../../textproc/py-black
BUILD_DEPENDS+=	py-readme_renderer>=0:../../textproc/py-readme_renderer
BUILD_DEPENDS+=	py-flake8>=0:../../devel/py-flake8
BUILD_DEPENDS+=	py-mypy>=0:../../lang/py-mypy
BUILD_DEPENDS+=	py-cffi>1.14.0:../../devel/py-cffi
DEPENDS+=	# TODO: sidekick-properties~=0.1>=0
DEPENDS+=	# TODO: pymunk~=6.0>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
