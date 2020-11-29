# $NetBSD$

DISTNAME=	django-reactive-0.0.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/d6/3d/95281cb8e6bd6d017457fdbab5f93cc5953b8180c44d312f63c830923326/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/tyomo4ka/django-reactive
COMMENT=	Django JSON form field on steroids using react-json-schema-form
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-django>=2.2,<4.0:../../www/py-django
DEPENDS+=	py-jsonschema>=3.0,<4.0:../../textproc/py-jsonschema
DEPENDS+=	# TODO: psycopg2-binary>=2.7,<3.0
DEPENDS+=	# TODO: pytest-cov>=2.10.1,<3.0.0
DEPENDS+=	# TODO: pytest-django>=4.1.0,<5.0.0
DEPENDS+=	# TODO: pytest>=6.1.2,<7.0.0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
