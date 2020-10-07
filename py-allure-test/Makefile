# $NetBSD$

DISTNAME=	allure-pytest-2.8.18
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/^py//}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/0c/3f/04b2b0b072c922158eb86c9f72fe09a51aea2521ae95888fd9c289c5e1ae/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/allure-framework/allure-python
COMMENT=	Allure pytest integration
LICENSE=	apache-2.0

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=0:../../devel/py-setuptools_scm
DEPENDS+=	${PYPKGPREFIX}-test>=4.5.0:../../devel/py-test
DEPENDS+=	${PYPKGPREFIX}-six>=1.9.0:../../lang/py-six

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
