# $NetBSD$

DISTNAME=	ox_update-0.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/e6/b5/cb76456ebf2da106b0de08d643fdfea29171b63fae9f2930f78d9aaa2c25/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/emin63/ox_update
COMMENT=	Tools for updating software
LICENSE=	mit

DEPENDS+=	py-click>=0:../../devel/py-click
DEPENDS+=	py-boto3>=0:../../net/py-boto3

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
