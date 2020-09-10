# $NetBSD$

DISTNAME=	bigmler-4.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ea/c6/4d96befcbb61ea7c219a221266c7322a673444b0c89e32dfac9ab854dee1/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://bigml.com/developers
COMMENT=	Command-line tool for BigML.io, the public BigML API
LICENSE=	apache-2.0

BUILD_DEPENDS+=	${PYPKGPREFIX}-nose>=0:../../devel/py-nose
DEPENDS+=	${PYPKGPREFIX}-bigml>=5.0.0:../../wip/py-bigml
DEPENDS+=	${PYPKGPREFIX}-jsonschema>=:2.6.0:../../py-jsonschema
DEPENDS+=	${PYPKGPREFIX}-nbformat>=4.4.0:../../www/py-nbformat

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
