# $NetBSD$

DISTNAME=	pip-gui-tools-0.0.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/e2/11/304cdc1db059dbfca9bbacc98ec73422a576c9cf432c0babe149e3249ba8/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://files.pythonhosted.org/packages/e2/11/304cdc1db059dbfca9bbacc98ec73422a576c9cf432c0babe149e3249ba8/
COMMENT=	A tool for python pip package management
LICENSE=	mit

DEPENDS+=	py-pip>=0:../../devel/py-pip
DEPENDS+=	py-flask>=0:../../www/py-flask
DEPENDS+=	# TODO: pytest>=0
DEPENDS+=	# TODO: wheel-inspect>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
