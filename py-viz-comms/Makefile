# $NetBSD$

DISTNAME=	pyviz_comms-0.7.6
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/3f/26/1ff200993888bfa9faf173bc008e5e81390b2058386a7b192dabf0b3eb6e/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://pyviz.org
COMMENT=	Bidirectional communication for the PyViz ecosystem
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-param>=0:../../wip/py-param
TEST_DEPENDS+=	py-flake8>=0:../../devel/py-flake8
TEST_DEPENDS+=	py-nose>=0:../../devel/py-nose

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
