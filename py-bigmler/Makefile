# $NetBSD$

DISTNAME=	bigmler-4.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ea/c6/4d96befcbb61ea7c219a221266c7322a673444b0c89e32dfac9ab854dee1/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://bigml.com/developers
COMMENT=	A command-line tool for BigML.io, the public BigML API
#LICENSE=	http://www.apache.org/licenses/LICENSE-2.0 # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	py-nose>=0:../../devel/py-nose
DEPENDS+=	# TODO: bigml>=5.0.0,<6.0.0
DEPENDS+=	# TODO: jsonschema==2.6.0>=0
DEPENDS+=	py-nbformat>=4.4.0:../../www/py-nbformat

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
