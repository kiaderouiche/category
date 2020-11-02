# $NetBSD$

DISTNAME=	towncrier-19.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/eb/90/cdaaf0c0c03b17c3de0b9132334e69c8cde6028fadc2e81762fd312e7cdf/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/hawkowl/towncrier
COMMENT=	Building newsfiles for your project
LICENSE=	mit

BUILD_DEPENDS+=	py-incremental>=0:../../devel/py-incremental
DEPENDS+=	# TODO: Click>=0
DEPENDS+=	py-incremental>=0:../../devel/py-incremental
DEPENDS+=	py-jinja2>=0:../../textproc/py-jinja2
DEPENDS+=	py-toml>=0:../../textproc/py-toml

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
