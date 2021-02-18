# $NetBSD$

DISTNAME=	django-model-utils-4.1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/a5/7c/50b36fb5b1e63888107f0d215cae87197165e47de42b9d4142740547fba4/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/jazzband/django-model-utils
COMMENT=	Django model mixins and utilities
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	py-setuptools_scm>=0:../../devel/py-setuptools_scm
DEPENDS+=	# TODO: Django>=2.0.1
TEST_DEPENDS+=	# TODO: Django>=2.2

USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
