# $NetBSD$

DISTNAME=	pytest-repeat-0.8.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/1a/ef/a721646e592e834ad93e1c880956b3d6ff060c623c2e317170f5747d9c71/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/pytest-dev/pytest-repeat
COMMENT=	pytest plugin for repeating tests
#LICENSE=	Mozilla Public License 2.0 (MPL 2.0) # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	py-setuptools_scm>=0:../../devel/py-setuptools_scm
DEPENDS+=	# TODO: pytest>=3.6

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
