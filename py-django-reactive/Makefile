# $NetBSD$

DISTNAME=	django-reactive-0.0.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/django-reactive/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/tyomo4ka/django-reactive
COMMENT=	Django JSON form field on steroids using react-json-schema-form
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-django>=2.2,<4.0:../../www/py-django
DEPENDS+=	${PYPKGPREFIX}-jsonschema>=3.0,<4.0:../../textproc/py-jsonschema
DEPENDS+=	${PYPKGPREFIX}-psycopg2-binary>=2.7,<3.0:../../textproc/py-jsonschema
DEPENDS+=	${PYPKGPREFIX}-test-cov>=2.10.1,<3.0.0:../../textproc/py-jsonschema
DEPENDS+=	${PYPKGPREFIX}-test-django>=4.1.0,<5.0.0:../../textproc/py-jsonschema
DEPENDS+=	${PYPKGPREFIX}-pytest>=6.1.2,<7.0.0:../../textproc/py-jsonschema

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
